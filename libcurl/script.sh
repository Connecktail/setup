#!/bin/bash

if [ "$EUID" -ne 0 ]
then
    echo $0:"need to be superuser to run this script"
    exit
fi

echo -n "Installing development lib for curl..."
apt-get install libcurl4-gnutls-dev -yqqq
echo "done"
ldconfig

#how to use the lib in compilation :
# gcc test.c -lcurl -o test