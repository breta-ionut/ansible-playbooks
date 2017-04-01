#!/bin/bash

# This script fixes permissions on the files of the current PHP application.
# Basically, it will transfer the ownership of the files to another user
# than www-data and will give him only read permissions for files and
# read+execution for directories. It will allow though some exceptions:
# a predefined set of files will remain on the ownership of www-data.

sudo chown -R {{ item.value.owner }}:{{ item.value.group }} .
sudo chmod -R 0744 .
sudo find ./ -type d -print0 | sudo xargs -0 chmod 0745 

# Here we define the set of files which will be executable. You may modify
# it depending on your needs.
executable=( )
for file in "${executable[@]}"
do
	if [ -e "$file" ];
	then
		sudo chmod 0745 $file
	fi
done

# Here we define the set of files which will be owned by www-data. You may
# modify it depending on your needs.
writable=( )
for file in "${writable[@]}"
do
    if [ -e "$file" ];
    then
        sudo chown -R www-data:www-data $file
    fi
done
