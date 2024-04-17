#!/bin/bash
#
# devcontainerの初期設定スクリプト
#
# features: homebrew はarm64でビルドできない
# runArgsでlinux/amd64指定してもビルド不可
# 起動後に手動でインストールすることは可能
#
# ターミナルのシェルをzshに変更するfeatureはrunArgsのlinux/amd64指定でビルド不可
# homebrewは諦めて、aptでインストールする方がよさそう
#
# このスクリプトは、aptでインストールできない必須のツールをインストールする
#

if [ -z "${REMOTE_CONTAINERS}" ]; then
  echo "Not in a remote container, skipping..."
  exit 0
fi

# sheldon
curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
  | bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin
