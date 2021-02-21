#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "##############################################"
echo "# Setup NXLOG                                #"
echo "##############################################"

# Download NXLOG
#https://nxlog.co/products/nxlog-community-edition/download
wget https://nxlog.co/system/files/products/files/348/nxlog-ce_2.10.2150_ubuntu_bionic_amd64.deb
dpkg -i nxlog-ce_2.10.2150_ubuntu_bionic_amd64.deb
# wget http://nxlog.org/system/files/products/files/1/nxlog-ce_2.8.1248_ubuntu_1404_amd64.deb
# dpkg -i nxlog-ce_2.8.1248_ubuntu_1404_amd64.deb
apt-get install -f

# Remove default NXLOG configuration & replace
rm /etc/nxlog/nxlog.conf 
cp nxlog.conf /etc/nxlog/nxlog.conf

# Create certificates for SSL (directory in config)
mkdir /etc/nxlog/ssl
openssl req -x509 -nodes -days 1095 -newkey rsa:2048 -keyout /etc/nxlog/ssl/nxlog.key -out /etc/nxlog/ssl/nxlog.crt

#Install Maxmind GeoIP Modules for IP lookups if removed from dependencies
apt-get install geoip-bin
