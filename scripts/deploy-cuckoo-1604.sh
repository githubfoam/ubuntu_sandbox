#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "##############################################"
echo "#             Requirements                    #"
echo "##############################################"

apt-get update -qq

# https://cuckoo.sh/docs/installation/host/requirements.html
# software packages from the apt repositories are required to get Cuckoo to install and run properly

apt-get install -y python python3-pip python-dev libffi-dev libssl-dev
apt-get install - python-virtualenv python-setuptools
apt-get install -y libjpeg-dev zlib1g-dev swig

# dpkg: error processing archive /var/cache/apt/archives/mongodb-clients_1%3a2.6.10-0ubuntu1_amd64.deb (--unpack):
#  trying to overwrite '/usr/bin/bsondump', which is also in package mongodb-database-tools 100.3.1
# apt-get install -y mongodb

# In order to use PostgreSQL as database (our recommendation), PostgreSQL will have to be installed 
# apt-get install -y postgresql libpq-dev

# Virtualization Software
# install the latest version of VirtualBox on your Ubuntu LTS machine. 
# Note that Cuckoo supports VirtualBox 4.3, 5.0, 5.1, and 5.2
echo deb http://download.virtualbox.org/virtualbox/debian xenial contrib | sudo tee -a /etc/apt/sources.list.d/virtualbox.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
apt-get update -qq
apt-get install -y virtualbox-5.2

# Installing tcpdump
apt-get install -y tcpdump apparmor-utils
# the AppArmor profile disabling (the aa-disable command) is only required 
# when using the default CWD directory as AppArmor would otherwise prevent the creation of the actual PCAP files 
aa-disable /usr/sbin/tcpdump


# Tcpdump requires root privileges, but since you don’t want Cuckoo to run as root 
# you’ll have to set specific Linux capabilities to the binary
groupadd pcap
useradd cuckoo
usermod -a -G pcap cuckoo
chgrp pcap /usr/sbin/tcpdump

# If setcap installed
apt-get install libcap2-bin

setcap cap_net_raw,cap_net_admin=eip /usr/sbin/tcpdump
getcap /usr/sbin/tcpdump #verify

# Installing Volatility
# Cuckoo requires at least version 2.3 of Volatility, but recommends the latest version, Volatility 2.5

# https://github.com/volatilityfoundation/volatility3
git clone https://github.com/volatilityfoundation/volatility3.git
# See available options
volatility3
python3 vol.py -h
# python3 vol.py -f /home/user/samples/stuxnet.vmem windows.info #Example

# Installing M2Crypto
# Currently the M2Crypto library is only supported when SWIG has been installed
# apt-get install swig -y #swig is already the newest version (3.0.8-0ubuntu3)
# pip install --upgrade pip
# pip install m2crypto==0.24.0

# # Installing guacd
# # optional service that provides the translation layer for RDP, VNC, and SSH for the remote control functionality in the Cuckoo web interface
# apt-get install -y libguac-client-rdp0 libguac-client-vnc0 libguac-client-ssh0 guacd

# echo "##############################################"
# echo "#             Installing Cuckoo              #"
# echo "##############################################"

# # https://cuckoo.sh/docs/installation/host/installation.html
# sudo usermod -a -G vboxusers cuckoo

# #  a global installation of Cuckoo in your OS works
# # pip install -U pip setuptools
# # pip install -U cuckoo

# # ighly recommend installing Cuckoo in a virtualenv
# virtualenv venv
# . venv/bin/activate
# pip install -U pip setuptools
# pip install -U cuckoo