#!/bin/bash
sudo apt update
sudo apt install nginx -y
echo "Hello From Lab3 Private-EC2 $HOSTNAME" > /var/www/html/index.html