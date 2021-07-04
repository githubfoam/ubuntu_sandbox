#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "##############################################"
echo "#             REMnux Docker Files            #"
echo "##############################################"

apt-get update -qq

# https://github.com/REMnux/docker
# https://hub.docker.com/u/remnux
# https://docs.remnux.org/run-tools-in-containers/remnux-containers

# Contribute a Dockerfile
# https://docs.remnux.org/get-involved/add-or-update-tools/contribute-dockerfile

docker version
# update all local images from a Linux-like shell
docker images |cut -d' ' -f1 | grep -v REPOSITORY | xargs -I %s docker pull %s