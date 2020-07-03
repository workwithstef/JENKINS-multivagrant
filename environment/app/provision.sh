#!/bin/bash

# Update the sources list
sudo apt-get -y update

# upgrade any packages available
sudo apt-get -y upgrade

# install nginx
sudo apt-get -y install nginx

# install git
sudo apt-get -y install git

# install nodejs
sudo apt-get install python-software-properties
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get -y install nodejs

# install pm2
sudo npm -g install pm2

## App working on port 80 (reverse proxy)
# remove original default file & replace with new default
sudo rm /etc/nginx/sites-available/default
sudo cp /home/ubuntu/environment/default.conf /etc/nginx/sites-available/default

# npm install and start
echo 'export DB_HOST=mongodb://192.168.10.200:27017/posts' >> ~/.bashrc
sudo service nginx restart
# sudo npm install

# change to app directory
cd /home/ubuntu/app

#start app
pm2 start app.js
