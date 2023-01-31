#!/bin/bash

if [ "$EUID" -ne 0 ]
then
    echo $0:"need to be superuser to run this script"
    exit
fi

apt-get install libpq-dev -yqqq

#how to use the lib in compilation :
# gcc test.c -lpq -o test