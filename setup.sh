#!/bin/bash

if [ "$EUID" -ne 0 ]
then
    echo $0:"need to be superuser to run this script"
    exit
fi

deployment_folder="deployment"

for folder in $(ls -d */);
do
    cd $folder
    if [ -f "script.sh" ]
    then
        echo "Running script.sh in $folder"
        ./script.sh
    fi
    cd ../
done

cd $deployment_folder

if [ ! -f ".env" ]
then
    echo -n "Name of the database (default: connecktail): "
    read database_name
    if [ -z "$database_name" ]
    then
        database_name="connecktail"
    fi
    echo -n "Name of the user (default: admin): "
    read database_user
    if [ -z "$database_user" ]
    then
        database_user="admin"
    fi
    echo -n "Password of the user (default: admin): "
    read database_password
    if [ -z "$database_password" ]
    then
        database_password="admin"
    fi
    
    echo "DATABASE_NAME=$database_name" > .env
    echo "DATABASE_USER=$database_user" >> .env
    echo "DATABASE_PASSWORD=$database_password" >> .env
    
    exit
fi

echo "Creating the repository /etc/connecktail"
mkdir -p /etc/connecktail
echo "Creating the /etc/connecktail/msq file for the message queue"
touch /etc/connecktail/msq

docker compose up -d