#!/bin/bash
#
# install jq

pushd /tmp
  rm -rf jq
  wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 -O jq
  chmod +x jq
  sudo mv jq /usr/local/bin/
popd
