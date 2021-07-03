#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "##############################################"
echo "# How to Build Zeppelin from Source          #"
echo "##############################################"

# http://zeppelin.apache.org/docs/latest/setup/basics/how_to_build.html
# Clone the Apache Zeppelin repository
git clone https://github.com/apache/zeppelin.git
