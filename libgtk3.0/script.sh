#!/bin/bash

if [ "$EUID" -ne 0 ]
then
    echo $0:"need to be superuser to run this script"
    exit
fi

# Install dependencies
echo -n "Installing development lib for gtk3.0..."
apt-get install -yqqq libgtk3.0-dev
echo "done"
