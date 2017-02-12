#!/bin/sh 

# BBR 目的是要尽量跑满带宽, 并且尽量不要有排队的情况, 效果并不比速锐差
# 最新 4.9 内核已支持 tcp_bbr

uname -r

echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf

sysctl -p

sysctl net.ipv4.tcp_available_congestion_control
sysctl net.ipv4.tcp_congestion_control

lsmod | grep bbr