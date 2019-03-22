
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
#include <chrono>
#include <signal.h>

using namespace std;

int verbose = 1;
int save_raw = 0;
int no_write = 0;

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
  scoped_fd fd_dma;     // cardとhost間DMA転送   /dev/xdma0_c2h_0
  scoped_mmap mm_user;  // 制御用レジスタ        /dev/xdma0_user
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
  void update_clock(bool init_flag = false);
private:
  xdma_aximm xdma;
  uint64_t cur_addr = 0;
  static constexpr uint64_t addr_mask = 0x0fffffffu;
    // ワード単位のDRAMバッファの大きさ
  static constexpr uint64_t addr_word_l2 = 4;
    // フレームはワード(16byte)境界にalign
  static constexpr uint64_t CLOCK_COUNT_MASK = (1ull << 46ull) - 1ull;
  scoped_fd ofile;
  uint32_t err = 0;
  std::vector<uint8_t> buf_dma;
  uint32_t buf_dma_offset = 0;
  std::vector<uint8_t> buf_pcap;
  uint32_t overrun_count = 0;
  uint64_t interval_nbytes = 0;
  uint64_t interval_npackets = 0;
  uint64_t last_clock_cnt = 0;
  typedef std::chrono::system_clock clock_type;
  clock_type::time_point last_sys_clock;
  std::pair<uint32_t, uint32_t> last_pcap_ts = { 0, 0 };
private:
  /*
   * 制御用レジスタマップ (rx_wrmem_regs.v)
   * 8'h00: get_rd = { ERR_FULL[7:0], ERR_LONG[7:0], ERR_STS[7:0], 5'b0,
   *   ERR_DELIM, ERR_WCMD, ERR_S2MM };
   * 8'h01: get_rd = { 24'b0, ERR_FCS[7:0] };
   * 8'h02: get_rd = { WADDR_PRE[35:4] };
   * 8'h03: get_rd = { 4'b0, waddr_pre[63:36] };
   * 8'h04: get_rd = { WADDR_POST[35:4] };
   * 8'h05: get_rd = { 4'b0, waddr_post[63:36] };
   * 8'h06: get_rd = { cap_pkt[15:0], 1'b0, cap_wdata[14:0] };
   * 8'h07: get_rd = { 16'b0, cap_delim, cap_cnt, cap_wcmd, cap_wordcnt };
   * 8'h08: get_rd = { clock_cnt[31:0] };
   * 8'h09: get_rd = { clock_cnt_high_latch };
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
    // waddr_pre: 書き込む前に、書き込む領域の次のアドレスがセットされる。
    return (uint64_t(ah) << 32u) | al;
  }
  uint64_t get_waddr_post() const {
    // 下位32bitを読むと上位32bitがラッチされるようにしてあるので下位から読む
    uint32_t al = ((volatile uint32_t *)xdma.get_user())[4];
    uint32_t ah = ((volatile uint32_t *)xdma.get_user())[5];
    // waddr_post: 書き込んだ後に、書き込んだ領域の次のアドレスがセットされる。
    return (uint64_t(ah) << 32u) | al;
  }
  uint64_t get_clock_cnt() const {
    // 下位32bitを読むと上位32bitがラッチされるようにしてあるので下位から読む
    uint32_t vl = ((volatile uint32_t *)xdma.get_user())[8];
    uint32_t vh = ((volatile uint32_t *)xdma.get_user())[9];
    return (uint64_t(vh) << 32u) | vl;
  }
  uint32_t get_capa0() const {
    return ((volatile uint32_t *)xdma.get_user())[6];
  }
  uint32_t get_capa1() const {
    return ((volatile uint32_t *)xdma.get_user())[7];
  }
  std::pair<uint32_t, uint32_t> to_pcap_ts(uint64_t clk_cnt);
  void write_pcap();
};

void
eth_capture::show_stat()
{
  fprintf(stderr,
    "err=%08x err2=%08x pre=%016llx post=%016llx capa0=%08x capa1=%08x "
    "pkts=%llu bytes=%llu\n",
    get_err_stat(), get_err2_stat(), (unsigned long long)get_waddr_pre(),
    (unsigned long long)get_waddr_post(), get_capa0(), get_capa1(),
    (unsigned long long)interval_npackets,
    (unsigned long long)interval_nbytes);
  interval_npackets = 0;
  interval_nbytes = 0;
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
  update_clock(true);
}

std::pair<uint32_t, uint32_t>
eth_capture::to_pcap_ts(uint64_t clk_cnt)
{
  auto const cnt_diff = (last_clock_cnt - clk_cnt) & CLOCK_COUNT_MASK;
  auto const cnt_diff_us = (double)(cnt_diff) / 156.25;
  auto const ts = last_sys_clock - std::chrono::microseconds(
    uint64_t(cnt_diff_us));
  auto const ts_us = std::chrono::duration_cast<std::chrono::microseconds>(
    ts.time_since_epoch()).count();
  uint32_t ts_sec = ts_us / 1000000;
  uint32_t ts_usec = ts_us % 1000000;
  if (verbose > 1) {
    fprintf(stderr, "clk_cnt=%llu last_clk_cnt=%llu diff=%llu %f\n",
      (unsigned long long)clk_cnt,
      (unsigned long long)last_clock_cnt,
      (unsigned long long)cnt_diff, cnt_diff_us);
  }
  auto const r = std::pair<uint32_t, uint32_t>(ts_sec, ts_usec);
  // if (r > last_pcap_ts) {
    last_pcap_ts = r;
  // }
  return last_pcap_ts;
}

void
eth_capture::write_pcap()
{
  size_t const len = buf_dma_offset;
  size_t i = 0; // buf_dma上の読み出しオフセット
  size_t j = 0; // buf_pcap上の書き込みオフセット
  while (i + 8 <= len) {
    /*
     * buf_dmaのフォーマット(フレーム境界はワード(16byte)にalign)
     * +0: header
     *   { CLOCK_CNT[45:0], !packet_incomplete, fcs_correct, packet_len[15:0] }
     * +8: data
     */
    uint64_t const phdr = *(uint64_t const *)(buf_dma.data() + i);
    uint64_t const clk_cnt = phdr >> 18u;
    auto const ts = to_pcap_ts(clk_cnt);
    i += 8; // パケットヘッダ8byteの次へ移動
    uint32_t plen = phdr & 0xffffu;
    if (i + plen > len) {
      /* まだパケット全体を読み込み終わっていない(エラーではない) */
      if (verbose > 2) {
        fprintf(stderr, "incomplete packet data plen=%u i=%zu len=%zu\n",
          (unsigned)plen, i, len);
      }
      i -= 8;
      break;
    }
    if (j + plen + 16 >= buf_pcap.size()) {
      buf_pcap.resize(j + plen + 16);
    }
    *(uint32_t *)(buf_pcap.data() + j) = ts.first;
    *(uint32_t *)(buf_pcap.data() + j + 4) = ts.second;
    *(uint32_t *)(buf_pcap.data() + j + 8) = plen;
    *(uint32_t *)(buf_pcap.data() + j + 12) = plen;
    j += 16; // pcapヘッダの次へ移動
    memcpy(buf_pcap.data() + j, buf_dma.data() + i, plen); // パケット本体
    uint32_t idelta =
      ((plen + (1u << addr_word_l2) + 7u) >> addr_word_l2) << addr_word_l2;
    if (verbose > 1) {
      fprintf(stderr, "write_pcap: plen=%u idelta=%u\n", plen, idelta);
    }
    i += idelta - 8;
    j += plen;
    interval_npackets += 1;
    interval_nbytes += plen;
  }
  if (j != 0) {
    if (!no_write) {
      if (::write(ofile, buf_pcap.data(), j) != (ssize_t)j) {
        fprintf(stderr, "failed to write pcap data\n");
      }
    }
  }
  if (verbose > 0) {
    fprintf(stderr, "examined %zu bytes\n", i);
  }
  buf_dma_offset = len - i;
  if (buf_dma_offset != 0) {
    memmove(buf_dma.data(), buf_dma.data() + i, buf_dma_offset);
  }
}

void
eth_capture::update_clock(bool init_flag)
{
  auto const clock_cnt = get_clock_cnt() & CLOCK_COUNT_MASK;
  auto const sys_clock = clock_type::now();
  if (init_flag) {
    last_clock_cnt = clock_cnt;
    last_sys_clock = sys_clock;
    return;
  }
  uint64_t const cnt_diff = (clock_cnt - last_clock_cnt) & CLOCK_COUNT_MASK;
  auto const cnt_diff_ns = (double)(cnt_diff) * (1000.0 / 156.25);
  auto const est_sys_clock = last_sys_clock + std::chrono::nanoseconds(
    uint64_t(cnt_diff_ns));
  auto const diff = sys_clock - est_sys_clock;
  auto const diff_ns = std::chrono::duration_cast<std::chrono::nanoseconds>(
    diff).count();
  if (verbose > 2) {
    fprintf(stderr, "sysclk_diff_ns=%lld\n", (long long)diff_ns);
  }
  last_clock_cnt = clock_cnt;
  auto const diff_ns_delta = diff_ns / 8; /* ズレの1/8だけ反映させる */
  last_sys_clock = est_sys_clock + std::chrono::nanoseconds(diff_ns_delta);
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
  // 一度にpread()するサイズ。リングバッファの末尾を跨ぐことはできないので
  // 末尾まで達するときはそこで切る。
  size_t len = (waddr_post_low < cur_addr_low)
    ? ((addr_mask - cur_addr_low + 1) << addr_word_l2)
    : ((waddr_post_low - cur_addr_low) << addr_word_l2);
  if (len > buf_dma.size() - buf_dma_offset) {
    len = buf_dma.size() - buf_dma_offset;
  }
  if (verbose > 0) {
    fprintf(stderr, "addr=%llx waddr_post=%llx len=%zx\n",
      (unsigned long long)cur_addr, (unsigned long long)waddr_post, len);
  }
  ssize_t const e = ::pread(xdma.get_dma(), buf_dma.data() + buf_dma_offset,
    len, off_start);
  if (e != ssize_t(len)) {
    if (verbose > 1) {
      fprintf(stderr, "pread len=%zu r=%zd\n", len, e);
    }
    return 0;
  }
  uint64_t const waddr_pre = get_waddr_pre();
  uint64_t const waddr_diff = waddr_pre - cur_addr;
  if (waddr_diff > uint64_t(addr_mask + 1)) {
    fprintf(stderr, "overrun %llx\n", (unsigned long long)waddr_diff);
    buf_dma_offset = 0;
    cur_addr = get_waddr_post();
    if (overrun_count < 0xffffffffu) {
      overrun_count += 1;
    }
    return len;
  }
  update_clock();
  if (verbose > 0) {
    fprintf(stderr, "waddr_diff=%llx mask=%llx pre=%llx\n",
      (unsigned long long)waddr_diff, (unsigned long long)addr_mask,
      (unsigned long long)waddr_pre);
  }
  buf_dma_offset += len;
  write_pcap();
  cur_addr += len >> addr_word_l2;
  return len;
}

int main(int argc, char **argv)
{
  for (int i = 1; i < argc; ++i) {
    std::string const s(argv[i]);
    if (s == "-v" && i + 1 < argc) {
      verbose = atoi(argv[i + 1]);
    }
    if (s == "-r") {
      save_raw = 1;
    }
    if (s == "-n") {
      no_write = 1;
    }
  }
  /* シグナルで割り込むとxdmaドライバがおかしくなることがある。そのため
   * SIGINT等では止められないようにする。標準入力が閉じられると終了する。
   * xdmaドライバがおかしくなったときはinsmodしなおすと直る。
   */
  signal(SIGINT, SIG_IGN);
  signal(SIGTERM, SIG_IGN);
  typedef std::chrono::system_clock clock_type;
  try {
    auto prev_stat_time = clock_type::now();
    eth_capture capt;
    capt.show_stat();
    capt.capture_start();
    while (true) {
      auto now = clock_type::now();
      if (now - prev_stat_time >= std::chrono::seconds(1)) {
        prev_stat_time += std::chrono::seconds(1);
        capt.show_stat();
      }
      size_t len = capt.capture_one();
      if (len == 0) {
        std::this_thread::sleep_for(std::chrono::microseconds(10000));
        capt.update_clock();
      } else {
        if (verbose > 0) {
          fprintf(stderr, "capture len=%zu\n", len);
        }
      }
      {
        fcntl(0, F_SETFL, O_NONBLOCK);
        char ch = 0;
        if (read(0, &ch, 1) == 0) {
          break;
        }
      }
    }
    return 0;
  } catch (std::exception const& ex) {
    fprintf(stderr, "caught: %s\n", ex.what());
    return 1;
  }
}

