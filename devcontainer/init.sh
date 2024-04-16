#!/usr/bin/zsh
#
# devcontainerの初期設定スクリプト
# eval fzf の関係でシェバンはzshを指定している
#

if [ -z ${REMOTE_CONTAINERS} ]; then
  echo "Not in a remote container, skipping..."
  exit 0
fi

if type brew; then

  type brew && brew install vim tmux fzf jq ripgrep ghq sheldon gh tig lazygit

  # Set up fzf key bindings and fuzzy completion
  eval "$(fzf --zsh)"

fi
