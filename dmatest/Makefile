
all: xdma_mm dmatest

xdma_mm: xdma_mm.cpp
	g++ --std=c++11 -Wall -O3 -g $^ -o $@

dmatest: dmatest.cpp
	g++ --std=c++11 -Wall -O3 -g $^ -o $@

clean:
	rm -f xdma_mm dmatest rand_data read_data eth_capture.out eth_capture.pcap

