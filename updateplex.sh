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

touch cookie.txt
chmod 777 cookie.txt

echo "Identifying newest plex version"

URL=$(php curl_plex.php | grep '="Ubuntu">64-bit</a>' | cut -d'"' -f2)

echo "Downloading newest plex verison"
rm cookie.txt
wget $URL -P ~/

while true; do
    read -p "Do you wish to install the newest version of plex (plexpass)?" yn
    case $yn in
        [Yy]* ) sudo dpkg -i ~/plexmediaserver*;rm ~/plexmediaserver* ;break;;
        [Nn]* ) echo Quitting...;exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
