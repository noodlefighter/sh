#!/bin/sh 

# 安装LNMP
wget -c http://soft.vpser.net/lnmp/lnmp1.3-full.tar.gz && tar zxf lnmp1.3-full.tar.gz && cd lnmp1.3-full && ./install.sh lnmp

#按上述命令执行后，会出现如下提示：
#
#需要设置MySQL的root密码（不输入直接回车将会设置为root）如果输入有错误需要删除时，可以
#
#询问是否需要启用MySQL InnoDB，InnoDB引擎默认为开启，一般建议开启，直接回车或输入 y 
#选择MySQL版本，目前提供了较多版本的MySQL和MariaDB，需要注意的是MySQL 
#
#输入对应MySQL或MariaDB版本前面的序号，回车进入下一步，选择PHP版本：
#注意：选择PHP7等高版本时需要自行确认是否与自己的程序兼容。
#
#输入要选择的PHP版本的序号，回车进入下一步，选择是否安装内存优化：
#
#可以选择不安装、Jemalloc或TCmalloc，输入对应序号回车，直接回车为默认为不安装。
#
#如果是LNMPA或LAMP的话还会提示“Please enter Administrator Email 
#
#再选择Apache版本
#
#按提示输入对应版本前面的数字序号，回车。
#
#提示"Press any key to install...or Press Ctrl+c to cancel"后，按回车键确认开始安装。 
#LNMP脚本就会自动安装编译Nginx、MySQL、PHP、phpMyAdmin、Zend Optimizer这几个软件。
#
#安装时间可能会几十分钟到几个小时不等，主要是机器的配置网速等原因会造成影响。 