#!/bin/bash

# Start cron service
service cron start

# Ensure daily cron jobs are executable
chmod +x /etc/cron.daily/*

# Make sure the config file can be written to
chown www-data /var/www/html/include/config.php
chmod 744 /var/www/html/include/config.php

# Start Apache in the foreground (keeps the container alive)
apachectl -D FOREGROUND
