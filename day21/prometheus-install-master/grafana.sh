#!/bin/bash

read -p "Enter Grafana admin account password: " PASSWORD

sudo apt-get install -y adduser libfontconfig
sudo apt install -y apt-transport-https

wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -

echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee /etc/apt/sources.list.d/grafana.list

# Download grafana

# wget https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_4.6.3_amd64.deb

# Install grafana
sudo apt-get update

sudo apt-get install grafana -y

#sudo dpkg -i grafana_4.6.3_amd64.deb

# systemd
sudo systemctl daemon-reload
sudo systemctl enable grafana-server
sudo systemctl start grafana-server

# Installation cleanup
#rm grafana_4.6.3_amd64.deb

# Configure Grafana Login

sudo systemctl stop grafana-server
sleep 10
sudo grafana-cli admin reset-admin-password $PASSWORD
sleep 10
sudo systemctl daemon-reload
sudo systemctl restart grafana-server