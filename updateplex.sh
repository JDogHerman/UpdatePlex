#!/bin/bash
#This script will log into plex and download the newest plexpass version for Ubnutu 64 bit
if [ ! -f variables.php ]; then
    echo "<?php" > variables.php
    echo "    \$login = '';" >> variables.php
    echo "    \$password = '';" >> variables.php
    echo "?>" >> variables.php
    echo "Please open variables.php in an editor of choice and complete the required fields before running again."
    exit 1
fi
# creating the cookie.txt file for the session
touch cookie.txt
chmod 777 cookie.txt

echo "Identifying newest plex version"
# Running the php command to get the newest plexpass version of plex using the login info in variables.php and setting that path to $URL
URL=$(php curl_plex.php | grep '="Ubuntu">64-bit</a>' | cut -d'"' -f2)

echo "Downloading newest plex verison"
# Removing the session cookie, cookie.txt
rm cookie.txt
# Downloading the file to the users home directory
wget $URL -P ~/

# Asking the user if they want to install the file or not. If yes then after it will remove the deb file.
while true; do
    read -p "Do you wish to install the newest version of plex (plexpass)?" yn
    case $yn in
        [Yy]* ) sudo dpkg -i ~/plexmediaserver*;rm ~/plexmediaserver* ;break;;
        [Nn]* ) echo Quitting...;exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
