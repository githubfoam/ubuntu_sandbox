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
apt-get install -y python python-pip python-dev libffi-dev libssl-dev
apt-get install - python-virtualenv python-setuptools
apt-get install -y libjpeg-dev zlib1g-dev swig
