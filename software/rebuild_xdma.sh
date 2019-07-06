#!/bin/bash

XDMA_DRIVER_DIR=$HOME/xdma_driver
MOK_FILE=$HOME/MOK

cd $XDMA_DRIVER_DIR/xdma
make clean
make
/usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 $MOK_FILE.priv $MOK_FILE.der xdma.ko
