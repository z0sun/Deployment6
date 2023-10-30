#!/bin/bash

sudo apt update
sudo apt install build-essential 
sudo apt install -y default-jre
sudo apt-get install pkg-config
<<<<<<< HEAD
sudo apt install -y libmysqlclient-dev

# Update packages
sudo apt update -y

# Install Python
sudo apt install -y software-properties-common
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt update -y
sudo apt install -y python3.7 python3.7-venv
sudo apt install -y python3.7-dev


# Install Python3 pip
sudo apt install python3-pip -y

######## Install HashiCorp's Debian package repository #########
sudo apt update 

sudo apt install -y openjdk-11-jre ## Java
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

########### Install the HashiCorp GPG key. #########

wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

########## Verify the key's fingerprint. #######

gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint

####### Add the official HashiCorp repository to your system #####

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

####### Download the package information from HashiCorp. ######

sudo apt update

######## Install Terraform from the new repository. #######

sudo apt-get install terraform

touch ~/.bashrc

terraform -install-autocomplete
=======
#c
sudo apt install libmysqlclient-dev -y

curl -O https://raw.githubusercontent.com/z0sun/runit/main/pythoninstall.sh
chmod +x pythoninstall.sh
./python.sh
sudo apt install -y python3.7-dev

curl -O https://raw.githubusercontent.com/z0sun/runit/main/installterraform.sh
chmod +x installterraform.sh
./installterraform.sh
>>>>>>> eda76f4505caf0b2f4fc14bf41ee7be0efde81af


