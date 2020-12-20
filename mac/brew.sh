#!/bin/bash
#
# brewでインストールする一覧
#
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#
#
# 他のGNU系
# binutils findutils diffutils coreutils moreutils

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
  mosh \
  pyenv \
  pyenv-virtualenv

brew cleanup
