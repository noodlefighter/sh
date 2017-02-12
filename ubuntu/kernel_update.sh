#!/bin/sh 

# 换内核
# 下载最新内核,最新内核查看这里 http://kernel.ubuntu.com/~kernel-ppa/mainline
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.9.7/linux-image-4.9.7-040907-generic_4.9.7-040907.201702010331_amd64.deb

dpkg -i linux-image-4.9.7*.deb

update-grub
reboot