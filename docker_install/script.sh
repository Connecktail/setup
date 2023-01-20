#!/bin/bash

if [ "$EUID" -ne 0 ]
then
    echo $0:"need to be superuser to run this script"
    exit
fi

# Install docker
apt-get update -qqq
apt-get upgrade -yqqq
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

usermod -aG docker $USER
newgrp docker

# Install docker-compose
apt-get install libffi-dev libssl-dev -yqqq
apt install python3-dev -yqqq
apt-get install -yqqq python3 python3-pip
pip3 install docker-compose
systemctl enable docker