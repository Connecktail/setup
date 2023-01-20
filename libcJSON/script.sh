#!/bin/bash

if [ "$EUID" -ne 0 ]
then
    echo $0:"need to be superuser to run this script"
    exit
fi

git clone https://github.com/DaveGamble/cJSON.git
mkdir build
cd build
cmake ../cJSON
make
make install

#how to use the lib in compilation :
# gcc test.c -lcjson -o test