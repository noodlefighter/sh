#!/bin/sh 

# 建git仓库(参数1) 并设置hook fetch时自动发布到指定目录(参数2)
if [ "$1" = "" ]; then 
    echo "folder error"
    exit
fi
if [ "$2" = "" ]; then 
    echo "deploy folder error"
    exit
fi

DIR="$( cd "$( dirname "$0"  )" && pwd  )"

# 建仓库
sudo git init --bare $1

# 建立发布目录 禁止其他用户访问.git
rm -R $2
git clone $1 $2
chown -R git:git $2
chmod -R 755 $2
chmod -R 700 $2/.git

# 创建发布hook 设置执行权限
cp $DIR/_hook_post-receive.txt $1/hooks/post-receive
sed -i "s;DeployPath=\"/var/web\";DeployPath='$2';" $1/hooks/post-receive
chmod 755 $1/hooks/post-receive
sudo chown -R git:git $1

