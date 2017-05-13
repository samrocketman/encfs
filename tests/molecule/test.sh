#!/bin/bash

set -e

#canonicalize executes in a subshell
function canonicalize() (
  cd "$1"
  echo "$PWD"
)

#
# SETUP ENVIRONMENT
#

#Determine the proper path based on this script.
if [ "${0%/*}" = 'test.sh' ]; then
  export ENCFS_ROOT="$(canonicalize "../../")"
else
  export ENCFS_ROOT="$(canonicalize "${0%/*}/../..")"
fi
cd "${ENCFS_ROOT}/tests/molecule/"

#Set up virtualenv if not already set up.
if [ ! -d ".venv" ]; then
  echo '$ virtualenv --python $(type -P python2.7) .venv'
  virtualenv --python $(type -P python2.7) .venv
fi
#Activate virtualenv if not already activated.
if [ ! "$(type -P molecule)" = "${PWD}/.venv/bin/molecule" ]; then
  echo '$ source .venv/bin/activate'
  source .venv/bin/activate
fi
#Install pip-requirements.txt if not already installed.
if [ ! -x ".venv/bin/molecule" ]; then
  pip install -U pip
  echo '$ pip install --no-deps -r pip-requirements.txt'
  pip install --no-deps -r pip-requirements.txt
fi

echo "ENVIRONMENT:"
echo "    ENCFS_ROOT=${ENCFS_ROOT}"
echo "    PWD=${PWD}"

#
# RUN TESTS
#

if [ -z "$1" ]; then
  echo '$ molecule test'
  molecule test
else
  #This currently does not work :-(
  #ref: https://github.com/metacloud/molecule/issues/827
  echo '$ molecule test --platform "'"$1"'"'
  molecule test --platform "$1"
fi
