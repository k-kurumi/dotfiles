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

type apt-get && sudo apt-get update && sudo apt-get install -y tig vim ripgrep tmux direnv git-crypt file iputils-ping wget curl

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

git config --global core.editor vim

# https://taskfile.dev/installation/#install-script
sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b ~/.local/bin

# sshdはfeaturesで追加する (aptでopen-sshserverをインストールしてもsystemdがないので動かない)
# devcontainer.jsonの設定: featuresでsshd追加, forwardPortsで2222指定
# docker psではポートが開いていないように見えるが ssh vscode@localhost -p 2222 で接続可能
mkdir -p ~/.ssh
curl -o ~/.ssh/authorized_keys https://github.com/k-kurumi.keys

# # neovim and lunarvim
# # FIXME neovimのarm対応版がリリースされたら利用したい (appimageはx64のためarmで起動できない)
# pushd "$HOME" || exit
#   sudo apt-get install -y ninja-build gettext cmake unzip curl build-essential
#   git clone --depth 1 https://github.com/neovim/neovim
#   cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
#   sudo make install
#   yes no | LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)
# popd || exit

# FIXME インストールしてもうまく動かないのがあるで調査する
code --install-extension oderwat.indent-rainbow
code --install-extension streetsidesoftware.code-spell-checker
