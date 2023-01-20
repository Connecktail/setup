#!/bin/bash

if [ "$EUID" -ne 0 ]
then
    echo $0:"need to be superuser to run this script"
    exit
fi

folders=( "docker_install" "libcJSON" "libwsServer" "access_point" )
deployment_folder="deployment"

for folder in ${folders[@]}
do
    cd $folder
    ./script.sh
    cd ../
done

cd $deployment_folder
./start.sh