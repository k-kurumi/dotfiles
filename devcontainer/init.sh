#!/bin/bash
#
# devcontainerの初期設定スクリプト
# eval fzf の関係でシェバンはzshを指定している
#

if [ -z "${REMOTE_CONTAINERS}" ]; then
  echo "Not in a remote container, skipping..."
  exit 0
fi

# homebrewはlinux(arm64)に対応していない
if [[ $(uname -m) == "x86_64" ]]; then
  type brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "homebrew unsupported architecture: $(uname -m)"
  exit 1
fi

#
# 以降はhomebrewインストール済み
#

brew install vim tmux fzf jq ripgrep ghq sheldon gh tig lazygit direnv

# evalはzsh起動して実行する必要あり
type fzf > /dev/null && cat <<'EOL'
## Set up fzf key bindings and fuzzy completion
## evalはzsh起動して実行する必要あり
eval "$(fzf --zsh)"
EOL
