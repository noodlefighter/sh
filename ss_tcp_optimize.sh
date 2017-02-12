#!/bin/sh 

cd /etc/sysctl.d

touch local.conf
echo "# max open files"             >> local.conf
echo "fs.file-max = 51200"          >> local.conf
echo "# max read buffer"          >> local.conf
echo "net.core.rmem_max = 67108864"          >> local.conf
echo "# max write buffer"          >> local.conf
echo "net.core.wmem_max = 67108864"          >> local.conf
echo "# default read buffer"          >> local.conf
echo "net.core.rmem_default = 65536"          >> local.conf
echo "# default write buffer"          >> local.conf
echo "net.core.wmem_default = 65536"          >> local.conf
echo "# max processor input queue"          >> local.conf
echo "net.core.netdev_max_backlog = 4096"          >> local.conf
echo "# max backlog"          >> local.conf
echo "net.core.somaxconn = 4096"          >> local.conf
echo ""          >> local.conf
echo "# resist SYN flood attacks"          >> local.conf
echo "net.ipv4.tcp_syncookies = 1"          >> local.conf
echo "# reuse timewait sockets when safe"          >> local.conf
echo "net.ipv4.tcp_tw_reuse = 1"          >> local.conf
echo "# turn off fast timewait sockets recycling"          >> local.conf
echo "net.ipv4.tcp_tw_recycle = 0"          >> local.conf
echo "# short FIN timeout"          >> local.conf
echo "net.ipv4.tcp_fin_timeout = 30"          >> local.conf
echo "# short keepalive time"          >> local.conf
echo "net.ipv4.tcp_keepalive_time = 1200"          >> local.conf
echo "# outbound port range"          >> local.conf
echo "net.ipv4.ip_local_port_range = 10000 65000"          >> local.conf
echo "# max SYN backlog"          >> local.conf
echo "net.ipv4.tcp_max_syn_backlog = 4096"          >> local.conf
echo "# max timewait sockets held by system simultaneously"          >> local.conf
echo "net.ipv4.tcp_max_tw_buckets = 5000"          >> local.conf
echo "# turn on TCP Fast Open on both client and server side"          >> local.conf
echo "net.ipv4.tcp_fastopen = 3"          >> local.conf
echo "# TCP receive buffer"          >> local.conf
echo "net.ipv4.tcp_rmem = 4096 87380 67108864"          >> local.conf
echo "# TCP write buffer"          >> local.conf
echo "net.ipv4.tcp_wmem = 4096 65536 67108864"          >> local.conf
echo "# turn on path MTU discovery"          >> local.conf
echo "net.ipv4.tcp_mtu_probing = 1"          >> local.conf

sysctl --system