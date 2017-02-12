#!/bin/sh 

# 换内核
# 下载最新内核,最新内核查看这里 http://kernel.ubuntu.com/~kernel-ppa/mainline
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.9.9/linux-image-4.9.9-040909-generic_4.9.9-040909.201702090333_i386.deb

dpkg -i linux-image-4.9.9*.deb

update-grub
reboot