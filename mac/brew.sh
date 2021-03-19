#!/bin/bash
#
# homebrewで関連ツールをインストールする
#
# homebrewのインストール
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#
# 他のGNU系は必要なら追加する
# binutils findutils diffutils moreutils
#
# trash-cliはtrash-listでpsutilがなくてエラーが出る
# head $(which trash-list) してパスを確認してから
# /usr/local/Cellar/trash-cli/0.20.11.23/libexec/bin/pip3 install psutil
# のように追加するとエラーが出なくなる

xcode-select --install

brew update
brew upgrade

# 事前にインストールされているときはunlink,uninstallする
# brew unlink neovim
# brew uninstall neovim
brew install --HEAD neovim

brew install \
  tmux \
  coreutils \
  macvim \
  jq \
  tree \
  wget \
  curl \
  tig \
  ghq \
  fzf \
  ag \
  ripgrep \
  mosh \
  pyenv \
  pyenv-virtualenv \
  tfenv \
  direnv \
  gpg \
  pinentry \
  trash-cli \
  grip \
  p7zip \
  yamllint \
  ansifilter \
  bat \
  git-delta \
  lf

brew cleanup
