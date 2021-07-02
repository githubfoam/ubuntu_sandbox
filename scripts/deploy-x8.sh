#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "##############################################"
echo "# Install x8                       #"
echo "##############################################"

apt-get update -qq
# rustc --version #rustc: command not found

curl https://sh.rustup.rs -sSf | sh -s -- -y
rustc --version

# https://github.com/Sh1Yo/x8
git clone https://github.com/Sh1Yo/x8
cd x8
cargo build --release