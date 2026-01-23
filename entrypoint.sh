#!/bin/bash

# Start cron service
service cron start

# Ensure daily cron jobs are executable
chmod +x /etc/cron.daily/*

# Make sure the config file can be written to
chown www-data /var/www/html/include/config.php
chmod 744 /var/www/html/include/config.php

# Link the config files to volumes
rm /var/www/html/include/config.php
ln -s /etc/resourcespace/resourcespace.php /var/www/html/include/config.php
rm /var/www/html/plugins/simplesaml/config/config.php
ln -s /etc/resourcespace/simplesaml.php /var/www/html/plugins/simplesaml/config/config.php

# Start Apache in the foreground (keeps the container alive)
apachectl -D FOREGROUND
