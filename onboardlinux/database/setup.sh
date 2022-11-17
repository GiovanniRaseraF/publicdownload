#!/bin/bash

# Building
sudo apt update -y
sudo apt install build-essential -y
sudo apt install net-tools -y

# Node
sudo apt install nodejs -y
sudo apt install npm -y
npm install express
npm install pg

# Postgress
sudo apt install postgresql postgresql-contrib -y
sudo systemctl start postgresql.service -y

# SSH Server
sudo apt install openssh-server -y

# Python3
sudo apt install python3 -y
sudo apt install python3-pip -y