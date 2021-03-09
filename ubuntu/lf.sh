#!/bin/bash
#
# CUIのファイルマネージャー
# rangerに似ているがgolangでシンプルで設定もしやすい
#
# https://github.com/gokcehan/lf/releases

version=r21

pushd /tmp
  rm -rf lf*
  wget "https://github.com/gokcehan/lf/releases/download/${version}/lf-linux-amd64.tar.gz"
  tar zxvf lf-linux-amd64.tar.gz
  sudo mv lf /usr/local/bin
popd
