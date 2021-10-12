#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "##############################################"
echo "#             nxlog                           #"
echo "##############################################"

echo "##############################################"
echo "# Install Dependencies                       #"
echo "##############################################"

apt-get update -qq
# apt-get install -qqy openjdk-7-jre-headless, nginx, pv, htop, socat, geoip-bin, git, make
# apt-get install -qqy openjdk-13-jre-headless, nginx, pv, htop, socat, geoip-bin, git, make

# Download and install Perl Modules
wget http://archive.ubuntu.com/ubuntu/pool/main/p/perl/perl-modules-5.26_5.26.1-6_all.deb
apt install ./perl-modules-5.26_5.26.1-6_all.deb

# Download and install Openssl library
wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl1.0/libssl1.0.0_1.0.2n-1ubuntu5.3_amd64.deb
apt install ./libssl1.0.0_1.0.2n-1ubuntu5.3_amd64.deb

# Download and install GNU dbm library
wget http://archive.ubuntu.com/ubuntu/pool/main/g/gdbm/libgdbm5_1.14.1-6_amd64.deb
apt install ./libgdbm5_1.14.1-6_amd64.deb

# Download and install Perl libraries
wget http://archive.ubuntu.com/ubuntu/pool/main/p/perl/libperl5.26_5.26.1-6_amd64.deb
apt install ./libperl5.26_5.26.1-6_amd64.deb

