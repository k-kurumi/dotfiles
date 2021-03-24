#!/bin/bash
#
# https://github.com/koalaman/shellcheck/releases
# https://github.com/mvdan/sh/releases
#

shellcheck_version=0.7.1
shfmt_version=3.2.4

pushd /tmp
  rm -rf shellcheck*
  wget "https://github.com/koalaman/shellcheck/releases/download/v${shellcheck_version}/shellcheck-v${shellcheck_version}.linux.x86_64.tar.xz"
  tar Jxvf "shellcheck-v${shellcheck_version}.linux.x86_64.tar.xz"
  sudo mv "shellcheck-v${shellcheck_version}/shellcheck" /usr/local/bin

  rm -rf shfmt*
  wget "https://github.com/mvdan/sh/releases/download/v${shfmt_version}/shfmt_v${shfmt_version}_linux_amd64"
  chmod +x "shfmt_v${shfmt_version}_linux_amd64"
  sudo mv "shfmt_v${shfmt_version}_linux_amd64" /usr/local/bin/shfmt
popd
