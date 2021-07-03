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

# Package python-pip is not available, but is referred to by another package.
# This may mean that the package is missing, has been obsoleted, or
# is only available from another source
# However the following packages replace it:
#   python3-pip
# apt-get install -y python python-pip python-dev libffi-dev libssl-dev
apt-get install -y python python3-pip python-dev libffi-dev libssl-dev
apt-get install - python-virtualenv python-setuptools
apt-get install -y libjpeg-dev zlib1g-dev swig

# In order to use the Django-based Web Interface, MongoDB is required
apt-get install -y mongodb

# In order to use PostgreSQL as database (our recommendation), PostgreSQL will have to be installed 
apt-get install -y postgresql libpq-dev