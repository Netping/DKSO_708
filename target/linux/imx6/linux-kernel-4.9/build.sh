#!/bin/sh

export ARCH=arm
export CROSS_COMPILE=/home/user/buildroot-2017.08-sk/output/host/usr/bin/arm-linux-gnueabihf-

make -j4 zImage
make -j4 modules
make imx6ull-sk.dtb