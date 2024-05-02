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

type apt-get && sudo apt-get update && sudo apt-get install -y tig vim ripgrep tmux direnv git-crypt neofetch

# fzfをaptでインストールすると補完周りが効かないため
test -d ~/.fzf || git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes Y | ~/.fzf/install

# sheldon
type sheldon || curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
  | bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin

# 開く大本のターミナルはsettings.jsonの"terminal.integrated.defaultProfile.linux": "zsh"で設定する
# tmuxのpaneはSHELLを参照している
touch ~/.profile
grep SHELL ~/.profile || echo 'export SHELL=/usr/bin/zsh' >> ~/.profile
# chshしなくてもzsh固定できているが念の為設定しておく
# userで一度受けるのはsudo時にUSER=rootとなるため
user="${USER}"
sudo chsh "${user}" -s /usr/bin/zsh

# UTC->JST
sudo ln -sf /usr/share/zoneinfo/Japan /etc/localtime
