#!/bin/sh 
sudo apt-get install git
sudo adduser git
# ssh 一行一个,格式:"ssh-rsa xxxx",一行一个
mkdir /home/git/.ssh
echo "ssh-rsa ........." > /home/git/.ssh/authorized_keys

# 第五步，禁用shell登录：
# 出于安全考虑，第二步创建的git用户不允许登录shell，这可以通过编辑/etc/passwd文件完成。找到类似下面的一行：
# git:x:1001:1001:,,,:/home/git:/bin/bash
# 改为：
# git:x:1001:1001:,,,:/home/git:/usr/bin/git-shell

# sudo git init --bare sample.git
# sudo chown -R git:git sample.git
# git clone git@server:/srv/sample.git