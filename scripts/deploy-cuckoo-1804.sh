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

# In order to use the Django-based Web Interface, MongoDB is required
# dpkg: error processing archive /tmp/apt-dpkg-install-iY61lp/07-mongo-tools_3.6.3-0ubuntu1_amd64.deb (--unpack):
#  trying to overwrite '/usr/bin/bsondump', which is also in package mongodb-database-tools 100.3.1
# apt-get install -y mongodb

# In order to use PostgreSQL as database (our recommendation), PostgreSQL will have to be installed 
# apt-get install -y postgresql libpq-dev

# Virtualization Software
# install the latest version of VirtualBox on your Ubuntu LTS machine. 
# Note that Cuckoo supports VirtualBox 4.3, 5.0, 5.1, and 5.2
# echo deb http://download.virtualbox.org/virtualbox/debian xenial contrib | sudo tee -a /etc/apt/sources.list.d/virtualbox.list
# wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
# apt-get update -qq
# The following packages have unmet dependencies:
#  virtualbox-5.2 : Depends: libcurl3 (>= 7.16.2) but it is not installable
#                   Depends: libpng12-0 (>= 1.2.13-4) but it is not installable
#                   Depends: libssl1.0.0 (>= 1.0.0) but it is not installable
#                   Depends: libvpx3 (>= 1.5.0) but it is not installable
#                   Recommends: libsdl-ttf2.0-0 but it is not going to be installed
#                   Recommends: pdf-viewer
# E: Unable to correct problems, you have held broken packages
# apt-get install -y virtualbox-5.2