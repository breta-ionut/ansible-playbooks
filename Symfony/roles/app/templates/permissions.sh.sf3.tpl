#!/bin/bash

# This script fixes permissions on the files of the current Symfony 3
# application. Basically, it will transfer the ownership of the files
# to another user than www-data and will give him only read permissions 
# for files and read+execution for directories. It will allow though 
# some exceptions: a predefined set of files will remain on the
# ownership of www-data.

sudo chown -R vagrant:vagrant .
sudo chmod -R 0744 .
sudo find ./ -type d -print0 | sudo xargs -0 chmod 0745 

# Here we define the set of files which will be owned by www-data. You may
# modify it depending on your needs.
writable=( "./var" )
for i in "${writable[@]}"
do
    if [ -e "$i" ];
    then
        sudo chown -R www-data:www-data $i
    fi
done
