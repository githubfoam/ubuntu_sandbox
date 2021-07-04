#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "##############################################"
echo "#             dockle                         #"
echo "##############################################"

apt-get update -qq

# https://github.com/goodwithtech/dockle
# https://github.com/goodwithtech/dockle#installation

# You can use Homebrew on Mac OS X or Linux and WSL (Windows Subsystem for Linux).
VERSION=$(
 curl --silent "https://api.github.com/repos/goodwithtech/dockle/releases/latest" | \
 grep '"tag_name":' | \
 sed -E 's/.*"v([^"]+)".*/\1/' \
) && curl -L -o dockle.deb https://github.com/goodwithtech/dockle/releases/download/v${VERSION}/dockle_${VERSION}_Linux-64bit.deb

dpkg -i dockle.deb && rm dockle.deb
