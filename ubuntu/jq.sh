#!/bin/bash
#
# install jq

version=1.6

pushd /tmp
  rm -rf jq
  wget https://github.com/stedolan/jq/releases/download/jq-${version}/jq-linux64 -O jq
  chmod +x jq
  sudo mv jq /usr/local/bin/
popd
