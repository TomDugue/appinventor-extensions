#!/usr/bin/env bash

dpkg --add-architecture i386

# Install dependencies
apt-get update
apt-get upgrade -y
apt-get install -y openjdk-8-jdk ant git

# Configure shell
echo "export PATH=$PATH:/opt/appengine/appengine-java-sdk-1.9.68/bin" >> /home/vagrant/.bashrc
echo "cd /vagrant/appinventor" >> /home/vagrant/.bashrc

# Configure java
update-java-alternatives -s java-1.8.0-openjdk-amd64