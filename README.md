# UpdatePlex

This is a collection of php and shell scripts that will pull the newest plexpass file for ubunutu and install it.

You will need to put your plex login information into the variables.php file.

This works for me with Ubuntu64 bit, hope it works for you.

Requirements:
PHP & PHP-curl

Usage:
sudo ./updateplex.sh

or use 

sudo ./updateplex.sh --force

to force the install (good to be used with a cron job)


PHP code orginally written by https://www.youtube.com/watch?v=_kQN-3aNCeI
