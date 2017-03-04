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

# 建立发布目录
mkdir $2
chown git:git $2
chmod 700 $2

# 创建发布hook 设置执行权限
cp $DIR/_hook_post-update.txt $1/hooks/post-update.sh
sed -i "s;DeployPath=\"/var/web\";DeployPath='$2';" $1/hooks/post-update.sh 
chmod +x $1/hooks/post-update.sh
sudo chown -R git:git $1

