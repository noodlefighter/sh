#!/bin/sh 

# install python etc.
apt-get install python-pip

# get shadowsocks-py-mu
git clone https://github.com/fsgmhoward/shadowsocks-py-mu.git
cd shadowsocks-py-mu
git checkout 3.1.1
cd ..
cp ./shadowsocks-py-mu/ ~/ -a
cd ~/shadowsocks-py-mu/shadowsocks/

# config ss
read -p "MYSQL_HOST(default=localhost):" mysql_host
if [ "$mysql_host" = "" ]; then 
    mysql_host="localhost"
fi

read -p "MYSQL_PORT(default=3306):" mysql_port
if [ "$mysql_port" = "" ]; then 
    mysql_port="3306"
fi 

read -p "MYSQL_USER(default=root):" mysql_user
if [ "$mysql_user" = "" ]; then 
    mysql_user="root"
fi

read -p "MYSQL_PASS(default=root):" mysql_pass
if [ "$mysql_pass" = "" ]; then 
    mysql_pass="root"
fi

echo "$mysql_host:$mysql_port"
echo "$mysql_user"
echo "$mysql_pass"

mv config_example.py config.py 
sed -i "s:MYSQL_HOST.*:MYSQL_HOST = '$mysql_host':g" config.py 
sed -i "s:MYSQL_PORT.*:MYSQL_PORT = '$mysql_port':g" config.py 
sed -i "s:MYSQL_USER.*:MYSQL_USER = '$mysql_user':g" config.py 
sed -i "s:MYSQL_PASS.*:MYSQL_PASS = '$mysql_pass':g" config.py 

# set ss startup

cd ~/shadowsocks-py-mu/shadowsocks/
nohup python server.py  > /dev/null 2>&1 &

 
# fw
iptables -I FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu
sysctl -w net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

iptables -I INPUT -p tcp --dport 50000:50200 -j ACCEPT
iptables -I INPUT -p udp --dport 50000:50200 -j ACCEPT

service iptables restart


 
 

 
# /usr/local/bin/ssserver -c /root/ss.json -d start
 
 
 