#!/bin/sh

echo "Updating apt dependencies"
sudo apt -y update && sudo apt -y upgrade


sudo apt -y install apt-transport-https ca-certificates curl software-properties-common

# Install Docker CE
echo "Installing Docker CE"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt -y update
sudo apt -y install docker-ce
echo "Docker CE installed successfully"

# Install Docker compose
echo "Installing Docker Compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
echo "Docker compose installed successfully"
