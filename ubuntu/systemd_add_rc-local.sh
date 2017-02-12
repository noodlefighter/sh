#!/bin/sh 

# Ubuntu 16.10没有rc.local 给他在systemd里加个
cd /etc/systemd/system/
touch rc-local.service
echo "[Unit]" >> rc-local.service
echo " Description=/etc/rc.local Compatibility" >> rc-local.service
echo " ConditionPathExists=/etc/rc.local" >> rc-local.service
echo " " >> rc-local.service
echo "[Service]" >> rc-local.service
echo " Type=forking" >> rc-local.service
echo " ExecStart=/etc/rc.local start" >> rc-local.service
echo " TimeoutSec=0" >> rc-local.service
echo " StandardOutput=tty" >> rc-local.service
echo " RemainAfterExit=yes" >> rc-local.service
echo " SysVStartPriority=99" >> rc-local.service

