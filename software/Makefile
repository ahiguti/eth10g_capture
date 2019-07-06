
all: eth_capture dmatest

eth_capture: eth_capture.cpp
	g++ --std=c++11 -Wall -O3 -g $^ -o $@

dmatest: dmatest.cpp
	g++ --std=c++11 -Wall -O3 -g $^ -o $@

clean:
	rm -f eth_capture dmatest rand_data read_data *.out *.pcap

