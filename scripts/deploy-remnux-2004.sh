#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "##############################################"
echo "#             REMnux                         #"
echo "##############################################"

apt-get update -qq

# https://docs.remnux.org/install-distro/install-from-scratch

# Step 2: Get the REMnux Installer
# Download the REMnux installer from the REMnux website by running this command on your new Ubuntu system
wget https://REMnux.org/remnux-cli

# generate the hash of your  file
sha256sum remnux-cli

# Set up the REMnux installer
mv remnux-cli remnux
chmod +x remnux
mv remnux /usr/local/bin

# Install GnuPG, so that the REMnux installer can automatically validate the signature of the REMux configuration files it will download during the installation process
apt-get install -yqq gnupg

# If you're planning to run REMnux in a local lab, kick off the installation
remnux install