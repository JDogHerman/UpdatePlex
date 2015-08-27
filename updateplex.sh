#!/bin/bash
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
