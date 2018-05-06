#!/bin/bash
################################################
# Script to install npm, angular cli,          #
# and mongodb for MEAN stack site deployment   #
# Author: Tyler Moon                           #
################################################

# Update the system
apt-get update -y && apt-get -y upgrade

# Install NPM
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt-get install -y nodejs

# Validate npm install
npm -v

# Install node-gyp as its required for @angular/cli
npm install -g node-gyp

# Install Angular CLI
npm install -g @angular/cli

# Validate Angular CLI install
ng help

# Add MongoDB Repo key
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927

# Create a list file from MongoDB
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list

# Update repository details in the packages list
apt-get update -y

# Install MongoDB
sudo apt-get install -y mongodb-org

# Start the Mongod service
systemctl start mongod

# Enable mongod on restart
systemctl enable mongod
