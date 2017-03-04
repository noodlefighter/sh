#!/bin/sh
read -p "folder:" folder
if [ "$folder" = "" ]; then 
    echo "folder error"
    exit
fi
sudo git init --bare $folder
sudo chown -R git:git $folder