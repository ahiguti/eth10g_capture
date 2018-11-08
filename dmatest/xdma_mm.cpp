
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <string>
#include <vector>
#include <stdio.h>
#include <errno.h>
#include <stdint.h>
#include <stdlib.h>
#include <sys/mman.h>
#include <sys/time.h>
#include <string.h>
#include <stdexcept>
#include <thread>

using namespace std;

struct scoped_fd {
  scoped_fd(int fd0 = -1) : fd(fd0) { }
  ~scoped_fd() { close(); }
  void reset(int fd0 = -1) {
    close();
    fd = fd0;
  }
  int close() {
    if (fd < 0) {
      return 0;
    }
    int e = ::close(fd);
    fd = -1;
    return e;
  }
  operator int() const { return fd; }
private:
  scoped_fd(scoped_fd const&) = delete;
  scoped_fd& operator =(scoped_fd const&) = delete;
  int fd = -1;
};

struct scoped_mmap {
  scoped_mmap(void *addr, size_t len0, int prot, int flags, int fd,
    off_t offset) {
    len = len0;
    ptr = mmap(addr, len0, prot, flags, fd, offset);
  }
  ~scoped_mmap() {
    if (ptr != MAP_FAILED) {
      munmap(ptr, len);
    }
  }
  void *get() const { return ptr; }
  size_t size() const { return len; }
private:
  void *ptr = MAP_FAILED;
  size_t len = 0;
  scoped_mmap(scoped_mmap const&) = delete;
  scoped_mmap& operator =(scoped_mmap const&) = delete;
};

struct xdma_aximm {
  xdma_aximm(const char *dma_fname, const char *user_fname,
    off_t user_offset, size_t user_size)
    : fd_dma(::open(dma_fname, O_RDWR)),
      mm_user(nullptr, user_size, PROT_READ | PROT_WRITE, MAP_PRIVATE,
        scoped_fd(::open(user_fname, O_RDWR | O_SYNC)), user_offset) { }
  int get_dma() const { return fd_dma; }
  void *get_user() const { return mm_user.get(); }
private:
  scoped_fd fd_dma;
  scoped_mmap mm_user;
};

struct eth_capture {
  eth_capture()
    : xdma("/dev/xdma0_c2h_0", "/dev/xdma0_user", 0, 4096)
  {
    if (xdma.get_dma() < 0) {
      throw std::runtime_error("failed to open xdma");
    }
    if (xdma.get_user() == MAP_FAILED) {
      throw std::runtime_error("failed to open xdma user");
    }
  }
  void show_stat();
  void capture_start();
  size_t capture_one();
  uint32_t capture_get_err() const { return err; }
private:
  xdma_aximm xdma;
  uint64_t cur_addr = 0;
  const uint64_t addr_mask = 0x0fffffffu;
  const uint64_t addr_word_l2 = 4;
  scoped_fd ofile;
  uint32_t err = 0;
  std::vector<uint8_t> buf_dma;
  uint32_t buf_dma_offset = 0;
  std::vector<uint8_t> buf_pcap;
  uint32_t overrun_count = 0;
private:
  /* (rx_wrmem_regs.v)
  wire [31:0] rd0 = { ERR_FULL[7:0], ERR_LONG[7:0], ERR_STS[7:0],
      5'b0, ERR_DELIM, ERR_WCMD, ERR_S2MM };
  wire [31:0] rd1 = 0;
  wire [31:0] rd2 = { WADDR_PRE[35:4] };
  wire [31:0] rd3 = { 4'b0, WADDR_PRE[63:36] };
  wire [31:0] rd4 = { WADDR_POST[35:4] };
  wire [31:0] rd5 = { 4'b0, WADDR_POST[63:36] };;
  wire [31:0] rd6 = { cap_pkt[15:0], cap_wdata[15:0] };
  wire [31:0] rd7 = { 16'b0, cap_delim, cap_cnt, cap_wcmd, cap_wordcnt };
  */
  uint32_t get_err_stat() const {
    return ((volatile uint32_t *)xdma.get_user())[0];
  }
  uint32_t get_err2_stat() const {
    return ((volatile uint32_t *)xdma.get_user())[1];
  }
  uint64_t get_waddr_pre() const {
    // 下位32bitを読むと上位32bitがラッチされるようにしてあるので下位から読む
    uint32_t al = ((volatile uint32_t *)xdma.get_user())[2];
    uint32_t ah = ((volatile uint32_t *)xdma.get_user())[3];
    return (uint64_t(ah) << 32u) | al;
  }
  uint64_t get_waddr_post() const {
    uint32_t al = ((volatile uint32_t *)xdma.get_user())[4];
    uint32_t ah = ((volatile uint32_t *)xdma.get_user())[5];
    return (uint64_t(ah) << 32u) | al;
  }
  uint32_t get_capa0() const {
    return ((volatile uint32_t *)xdma.get_user())[6];
  }
  uint32_t get_capa1() const {
    return ((volatile uint32_t *)xdma.get_user())[7];
  }
  void write_pcap();
};

void
eth_capture::show_stat()
{
  fprintf(stderr,
    "err=%08x err2=%08x pre=%016llx post=%016llx capa0=%08x capa1=%08x\n",
    get_err_stat(), get_err2_stat(), (unsigned long long)get_waddr_pre(),
    (unsigned long long)get_waddr_post(), get_capa0(), get_capa1());
}

void
eth_capture::capture_start()
{
  ofile.reset(::open("eth_capture.pcap", O_WRONLY | O_CREAT | O_TRUNC, 0644));
  err = get_err_stat();
  cur_addr = get_waddr_post();
  buf_dma.clear();
  buf_dma.resize(1 << 24);
  buf_dma_offset = 0;
  uint32_t pcap_hdr[6] = { };
  pcap_hdr[0] = 0xa1b2c3d4;
  pcap_hdr[1] = 0x00020004;
  pcap_hdr[2] = 0; // -3600 * 9; // TODO
  pcap_hdr[3] = 0;
  pcap_hdr[4] = 65535;
  pcap_hdr[5] = 1;
  if (::write(ofile, &pcap_hdr[0], sizeof(pcap_hdr)) < 0) {
    fprintf(stderr, "failed to write pcap header\n");
  }
}

void
eth_capture::write_pcap()
{
  size_t const len = buf_dma_offset;
  size_t i = 0;
  size_t j = 0;
  while (i + 8 <= len) {
    uint64_t phdr = *(uint64_t const *)(buf_dma.data() + i);
    if ((phdr >> 32u) != 0xdeadbeef) {
      fprintf(stderr, "unexpected packet header %llx\n",
        (unsigned long long)phdr);
      throw std::runtime_error("unexpected packet header");
    }
    i += 8;
    uint32_t plen = phdr & 0xffffu;
    if (i + plen > len) {
      /* not an error */
      /*
      fprintf(stderr, "incomplete packet data plen=%u i=%zu len=%zu\n",
        (unsigned)plen, i, len);
      */
      i -= 8;
      break;
    }
    if (j + plen + 16 >= buf_pcap.size()) {
      buf_pcap.resize(j + plen + 16);
    }
    *(uint32_t *)(buf_pcap.data() + j) = 0;
    *(uint32_t *)(buf_pcap.data() + j + 4) = 0;
    *(uint32_t *)(buf_pcap.data() + j + 8) = plen;
    *(uint32_t *)(buf_pcap.data() + j + 12) = plen;
    j += 16;
    memcpy(buf_pcap.data() + j, buf_dma.data() + i, plen);
    uint32_t idelta =
      ((plen + (1u << addr_word_l2) + 7u) >> addr_word_l2) << addr_word_l2;
    // fprintf(stderr, "plen=%u idelta=%u\n", plen, idelta);
    i += idelta - 8;
    j += plen;
  }
  if (j != 0) {
#if 1
    if (::write(ofile, buf_pcap.data(), j) != (ssize_t)j) {
      fprintf(stderr, "failed to write pcap data\n");
    }
#endif
  }
  fprintf(stderr, "examined %zu bytes\n", i);
  buf_dma_offset = len - i;
  if (buf_dma_offset != 0) {
    memmove(buf_dma.data(), buf_dma.data() + i, buf_dma_offset);
  }
}

size_t
eth_capture::capture_one()
{
  uint64_t const waddr_post = get_waddr_post();
  if (waddr_post == cur_addr) {
    return 0;
  }
  uint32_t const cur_addr_low = cur_addr & addr_mask;
  uint32_t const waddr_post_low = waddr_post & addr_mask;
  off_t const off_start = off_t(cur_addr_low) << addr_word_l2;
  size_t len = (waddr_post_low < cur_addr_low)
    ? ((addr_mask - cur_addr_low + 1) << addr_word_l2)
    : ((waddr_post_low - cur_addr_low) << addr_word_l2);
  if (len > buf_dma.size() - buf_dma_offset) {
    len = buf_dma.size() - buf_dma_offset;
  }
  fprintf(stderr, "addr=%llx waddr_post=%llx len=%zx\n",
    (unsigned long long)cur_addr, (unsigned long long)waddr_post, len);
  ssize_t const e = ::pread(xdma.get_dma(), buf_dma.data() + buf_dma_offset,
    len, off_start);
  if (e != ssize_t(len)) {
    fprintf(stderr, "pread len=%zu r=%zd\n", len, e);
    return 0;
  }
  uint64_t const waddr_pre = get_waddr_pre();
  //uint32_t const waddr_pre_low = waddr_pre & addr_mask;
  uint64_t const waddr_diff = waddr_pre - cur_addr;
  if (waddr_diff > uint64_t(addr_mask + 1)) {
    fprintf(stderr, "overrun %llx\n", (unsigned long long)waddr_diff);
    buf_dma_offset = 0;
    cur_addr = get_waddr_post();
    if (overrun_count <= 0xffffffffu) {
      overrun_count += 1;
    }
    return len;
  }
  fprintf(stderr, "waddr_diff=%llx mask=%llx pre=%llx\n",
    (unsigned long long)waddr_diff, (unsigned long long)addr_mask,
    (unsigned long long)waddr_pre);
  buf_dma_offset += len;
  write_pcap();
  cur_addr += len >> addr_word_l2;
  return len;
}

int main(int argc, char **argv)
{
  try {
    eth_capture capt;
    capt.show_stat();
    capt.capture_start();
    while (true) {
      size_t len = capt.capture_one();
      if (len == 0) {
        std::this_thread::sleep_for(std::chrono::microseconds(10000));
      } else {
        fprintf(stderr, "capture len=%zu\n", len);
      }
    }
    return 0;
  } catch (std::exception const& ex) {
    fprintf(stderr, "caught: %s\n", ex.what());
    return 1;
  }
}
