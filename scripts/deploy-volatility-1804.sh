#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "##############################################"
echo "#             Volatility 3                    #"
echo "##############################################"

apt-get update -qq

# https://github.com/volatilityfoundation/volatility3
# software packages from the apt repositories are required to get Cuckoo to install and run properly

git clone https://github.com/volatilityfoundation/volatility3.git && cd volatility3
python3 vol.py -h #See available options