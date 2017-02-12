#!/bin/sh 

# 换内核
sudo rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
sudo rpm -Uvh http://www.elrepo.org/elrepo-release-6-6.el6.elrepo.noarch.rpm
sudo yum --enablerepo=elrepo-kernel install kernel-ml -y

rpm -qa | grep kernel
sudo sed -i 's:default=.*:default=0:g' /etc/grub.conf
sudo sed -i 's:default=.*:default=0:g' /boot/grub/grub.conf
reboot