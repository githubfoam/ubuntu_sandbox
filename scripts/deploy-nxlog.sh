#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "##############################################"
echo "# Install Dependencies                       #"
echo "##############################################"

apt-get update -qq
# apt-get install -qqy openjdk-7-jre-headless, nginx, pv, htop, socat, geoip-bin, git, make
# apt-get install -qqy openjdk-13-jre-headless, nginx, pv, htop, socat, geoip-bin, git, make


echo "##############################################"
echo "# Configure UFW Firewall                     #"
echo "##############################################"

#  Allow HTTP(s)
ufw allow 80
ufw allow 443

# Allow syslog TCP/UDP in
ufw allow 514

# Allow syslog SSL in
ufw allow 1514

# Allow ElasticSearch (not for production)
ufw allow 9200

echo "##############################################"
echo "# Setup NXLOG                                #"
echo "##############################################"

# Download NXLOG
#https://nxlog.co/products/nxlog-community-edition/download
wget https://nxlog.co/system/files/products/files/348/nxlog-ce_2.10.2150_ubuntu_bionic_amd64.deb
dpkg -i nxlog-ce_2.10.2150_ubuntu_bionic_amd64.deb # method1
# apt install ./nxlog-ce_2.10.2150_ubuntu_bionic_amd64.deb # method2

# wget http://nxlog.org/system/files/products/files/1/nxlog-ce_2.8.1248_ubuntu_1404_amd64.deb
# dpkg -i nxlog-ce_2.8.1248_ubuntu_1404_amd64.deb
apt-get install -f

# Remove default NXLOG configuration & replace
# rm /etc/nxlog/nxlog.conf 
# cp nxlog.conf /etc/nxlog/nxlog.conf

# Create certificates for SSL (directory in config)
# mkdir /etc/nxlog/ssl
# openssl req -x509 -nodes -days 1095 -newkey rsa:2048 -keyout /etc/nxlog/ssl/nxlog.key -out /etc/nxlog/ssl/nxlog.crt

#Install Maxmind GeoIP Modules for IP lookups if removed from dependencies
# apt-get install geoip-bin
