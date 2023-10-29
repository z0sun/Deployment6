#!/bin/bash

sudo apt-get update -y

# Install JDK
sudo apt install openjdk-8-jdk -y
sudo apt-get update -y

# Download Jenkins keys
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt-get update -y

# Install & start Jenkins
sudo apt-get install -y fontconfig openjdk-17-jre jenkins
sudo systemctl start jenkins

# Start Jenkins
sudo systemctl start jenkins

# Install Python and Database
sudo apt update

sudo apt install -y software-properties-common

sudo add-apt-repository -y ppa:deadsnakes/ppa

sudo apt install -y python3.7

sudo apt install -y python3.7-venv

sudo apt install -y build-essential

sudo apt install -y libmysqlclient-dev

sudo apt install -y python3.7-dev

# Install Python3 pip
sudo apt install python3-pip -y

# Get Jenkins unlock key
echo "Jenkins Unlock Key:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

# Update packages
sudo apt update -y

sudo apt update
sudo apt install unzip

# Download AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install 
mkdir -p ~/.aws

# Download test file
curl -O https://dp5-auto1.s3.amazonaws.com/cat.txt

# Download config file from s3 bucket & replace 
curl https://dp5-auto1.s3.amazonaws.com/config.txt -o config
cp config ~/.aws/config

sudo apt update
sudo apt install build-essential libmysqlclient-dev
