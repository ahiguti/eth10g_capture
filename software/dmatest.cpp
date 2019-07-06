
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

using namespace std;

int usage(int argc, char **argv)
{
  fprintf(stderr, "%s [r|w|R|W] filename size_log2 "
    "[blocksize_log2 [offset [flags [repeat]]]]\n",
    argv[0]);
  return 1;
}

void *allocate_buffer(size_t len, int dma_flags)
{
  int flags = 0;
  if (dma_flags == 0) {
    // return aligned_alloc(4096, len);
    return malloc(len);
  }
  flags |= (dma_flags & 2) ? MAP_HUGETLB : 0;
  flags |= (dma_flags & 4) ? (21 << MAP_HUGE_SHIFT) : 0; // HUGE_2MB
  flags |= (dma_flags & 8) ? (30 << MAP_HUGE_SHIFT) : 0; // HUGE_1GB
  void *ptr = mmap(nullptr, len, PROT_READ | PROT_WRITE,
    MAP_PRIVATE | MAP_ANONYMOUS | flags, -1, 0);
  if ((size_t)ptr == (size_t)-1) {
    fprintf(stderr, "mmap failed: %d\n", errno);
    exit(3);
  }
  uint8_t *cp = (uint8_t *)ptr;
  for (size_t i = 0; i < len; i += 4096) {
    cp[i] = 0xff;
  }
  return ptr;
}

void deallocate_buffer(void *addr, size_t len, int dma_flags)
{
  if (dma_flags == 0) {
    return free(addr);
  }
  int r = munmap(addr, len);
  if (r != 0) {
    fprintf(stderr, "munmap failed: %d\n", errno);
    exit(3);
  }
}

int main(int argc, char **argv)
{
  if (argc < 4) {
    return usage(argc, argv);
  }
  int mmap_mode = 0;
  bool wr_mode = false;
  int open_flags = 0;
  string device = "";
  if (string(argv[1]) == "r") {
    wr_mode = false;
    open_flags = O_RDONLY;
    device = "/dev/xdma0_c2h_0";
  } else if (string(argv[1]) == "w") {
    wr_mode = true;
    open_flags = O_WRONLY;
    device = "/dev/xdma0_h2c_0";
  } else if (string(argv[1]) == "R") {
    wr_mode = false;
    mmap_mode = PROT_READ;
    // open_flags = O_RDONLY;
    open_flags = O_RDWR;
    device = "/dev/xdma0_user";
  } else if (string(argv[1]) == "W") {
    wr_mode = true;
    mmap_mode = PROT_WRITE;
    // open_flags = O_WRONLY;
    open_flags = O_RDWR;
    device = "/dev/xdma0_user";
  } else {
    return usage(argc, argv);
  }
  string const fn(argv[2]);
  size_t const len = (1ull << strtoull(argv[3], nullptr, 0));
  size_t const blk = argc > 4 ? (1ull << strtoull(argv[4], nullptr, 0)) : 4096;
  size_t const offset = argc > 5 ? strtoull(argv[5], nullptr, 0) : 0;
  int const dma_flags = argc > 6 ? strtol(argv[6], nullptr, 0) : 0;
  size_t const repeat = argc > 7 ? strtol(argv[7], nullptr, 0) : 1;
  void *dev_mm = (void *)-1;
  char *mm_ptr = nullptr;
  int devfd = open(device.c_str(), open_flags);
  if (devfd < 0) {
    fprintf(stderr, "open device: %d\n", errno);
    return 2;
  }
  if (mmap_mode != 0) {
    size_t moffset = offset & ~(getpagesize() - 1);
    dev_mm = mmap(nullptr, blk * len, PROT_READ | PROT_WRITE, MAP_PRIVATE,
      devfd, moffset);
    if (dev_mm == (void *)-1) {
      fprintf(stderr, "mmap: %d\n", errno);
      return 2;
    }
    mm_ptr = (char *)dev_mm;
    mm_ptr += offset - moffset;
  }
  int filefd = -1;
  if (!fn.empty()) {
    filefd = open(fn.c_str(),
      wr_mode ? (O_RDONLY) : (O_WRONLY | O_CREAT | O_TRUNC), 0644);
    if (filefd < 0) {
      fprintf(stderr, "open file: %d\n", errno);
      return 2;
    }
  }
  int fd_in = wr_mode ? filefd : devfd;
  int fd_out = wr_mode ? devfd : filefd;
  uint8_t *buf = (uint8_t *)allocate_buffer(blk, dma_flags);
  ssize_t e = 0;
  struct timeval t0 = { };
  gettimeofday(&t0, nullptr);
  for (size_t rep = 0; rep < repeat; ++rep) {
    for (size_t i = 0; i < len; i += blk) {
      size_t woffset = wr_mode ? offset : 0;
      size_t roffset = wr_mode ? 0 : offset; 
      if (mmap_mode == PROT_READ) {
        memcpy(buf, mm_ptr + i, blk);
      } else {
        if (fd_in >= 0 && lseek(fd_in, roffset + i, SEEK_SET) < 0) {
          fprintf(stderr, "lseek in: %d\n", errno);
        }
        if (fd_in >= 0 && (e = read(fd_in, buf, blk)) != (ssize_t)blk) {
          fprintf(stderr, "read in %zu: %zd errno=%d\n", blk, e, errno);
        }
      }
      if (mmap_mode == PROT_WRITE) {
        fprintf(stderr, "memcpy dst=%p buf=%p %zu\n", mm_ptr + i, buf, blk);
        memcpy(mm_ptr + i, buf, blk);
      } else {
        if (fd_out >= 0 && lseek(fd_out, woffset + i, SEEK_SET) < 0) {
          fprintf(stderr, "lseek out: %d\n", errno);
        }
        if (fd_out >= 0 && (e = write(fd_out, buf, blk)) != (ssize_t)blk) {
          fprintf(stderr, "write out %zu: %zd errno=%d\n", blk, e, errno);
        }
      }
    }
  }
  struct timeval t1 = { };
  gettimeofday(&t1, nullptr);
  if (dev_mm != (void *)-1) {
    if (munmap(dev_mm, blk * len) != 0) {
      fprintf(stderr, "munmap: %d\n", errno);
    }
  }
  if (close(devfd) != 0) {
    fprintf(stderr, "close dev: %d\n", errno);
  }
  if (filefd >= 0 && close(filefd) != 0) {
    fprintf(stderr, "close file: %d\n", errno);
  }
  timersub(&t1, &t0, &t1);
  double t = double(t1.tv_usec) / 1000000.0 + double(t1.tv_sec);
  double sz = double(len) * double(repeat);
  fprintf(stderr, "done %zu*%zu %fsec %fgbytes/s\n", len, repeat, t,
    sz / t / 1000000000.0);
  deallocate_buffer(buf, blk, dma_flags);
  return 0;
}

