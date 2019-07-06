#!/bin/bash

cd `dirname $0`
dd if=/dev/urandom of=rand_data bs=$((1024*1024)) count=4096
sudo ./dmatest w rand_data.dat 32 24
sudo ./dmatest r read_data.dat 32 24
sudo ./dmatest r /dev/null 32 24
cmp rand_data.dat read_data.dat

