#!/bin/bash
#installs java
sudo apt update
sudo apt search openjdk
sudo apt install openjdk-8-jdk -y

# installs and starts jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
    /etc/apt/sources.list.d/jenkins.list'
sudo apt update -y
sudo apt install jenkins -y

sudo systemctl start jenkins
