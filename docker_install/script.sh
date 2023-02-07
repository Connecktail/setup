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
curl -SL https://github.com/docker/compose/releases/download/v2.15.1/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
