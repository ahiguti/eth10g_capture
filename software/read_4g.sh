#!/bin/bash

cd `dirname $0`
rm -f read_data
sudo ./dmatest r /dev/null 32 24
sudo ./dmatest r read_data.dat 32 24

