#!/bin/sh 

read -p "SWAP_SIZE_MB(default=1024):" swap_size
if [ "$swap_size" = "" ]; then 
    swap_size="1024"
fi 

sudo dd if=/dev/zero of=/swapfile bs=1M count=$swap_size

# 格式化 swap
sudo mkswap /swapfile

# 啟動 swap
swapon /swapfile

sudo echo "/swapfile    swap    swap    defaults    0 0" >> /etc/fstab
