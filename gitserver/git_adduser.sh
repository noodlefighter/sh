#!/bin/sh 

# 安装git
# sudo apt-get install git

# 添加git用户
adduser git

# ssh 一行一个公钥,格式:"ssh-rsa xxxx",一行一个
mkdir /home/git/.ssh
echo "" > /home/git/.ssh/authorized_keys

# 权限设置 权限设置不对sshd不认..
chown git:git /home/git
chmod 755 /home/git

chown git:git /home/git/.ssh
chmod 700 /home/git/.ssh

chown git:git /home/git/.ssh/authorized_keys
chmod 400 /home/git/.ssh/authorized_keys

# 顺便如果sshd不好使 sshd打开10000端口调试模式看看debug log 
# /usr/sbin/sshd -p 10000 -d

# 禁用git用户shell登录
# 出于安全考虑，第二步创建的git用户不允许登录shell，这可以通过编辑/etc/passwd文件完成。找到类似下面的一行：
# git:x:1001:1001:,,,:/home/git:/bin/bash
# 改为：
# git:x:1001:1001:,,,:/home/git:/usr/bin/git-shell
sed -i '/^git:*/s;/bin/bash;/usr/bin/git-shell;' /etc/passwd
