#!/bin/bash

#DESCRIPTION
#  This script is meant to build EncFS from inside of a molecule container.

if [ ! -d "/molecule" ]; then
  echo "Script meant to only be run inside of molecule builds." 1>&2
  exit 1
fi

#exit immediately
set -xe

mkdir -p /usr/local/src/encfs/build
rsync -av /molecule/ /usr/local/src/encfs/
cd /usr/local/src/encfs/build/
cmake ..
make
make install
