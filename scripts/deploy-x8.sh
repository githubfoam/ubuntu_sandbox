#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "##############################################"
echo "#             Install x8                     #"
echo "##############################################"

apt-get update -qq
apt-get install -y cargo

echo "##############################################"
echo "#             Cargo Installed                #"
echo "##############################################"
# https://github.com/Sh1Yo/x8
git clone https://github.com/Sh1Yo/x8
cd x8
cargo build --release
echo "##############################################"
echo "from source code (rust should be installed)  #"
echo "##############################################"

wget https://github.com/berzerk0/Probable-Wordlists/blob/master/Real-Passwords/Top12Thousand-probable-v2.txt
mv Top12Thousand-probable-v2.txt wordlist.tx
ls -lai
# wc wordlist.txt 
# ./x8 -u https://4rt.one/ -w wordlist.txt -c 7 