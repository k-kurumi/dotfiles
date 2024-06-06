#!/bin/bash
#
# 設定ファイルなどの初期設定

set -x
set -eu

tmp_dir=$(mktemp -d)

echo ".Xmodmap
.ctags
.eslintrc.yml
.gitignore_global
.ideavimrc
.pryrc
.railsrc
.screenrc
.hyper.js
.tigrc
.tmux.conf
.zshrc
.ptconfig.toml
.vimrc" | while read f
do
  if [[ -f "${HOME}/${f}" ]]; then
    # 念のため既存ファイルは退避扱いにする
    mv "${HOME}/${f}" "${tmp_dir}"
  fi
  ln -sf "$(realpath ${f})" "${HOME}"
done

mkdir -p ~/.local/bin

################################################################################
#
# vim
#

# for swapfile
mkdir -p ~/.vim

## lunarvim
#mkdir -p ~/.config/lvim
#ln -sf "$(realpath lvim/config.lua)" ~/.config/lvim/config.lua

################################################################################
#
# git
#

# ghqが使用するフォルダ
mkdir -p ~/dev/src
mkdir -p ~/dev/bin
touch ~/.gitconfig

git config --global user.name k-kurumi
git config --global user.email optpia.kurumi@gmail.com

git config --global ghq.root '~/dev/src'

# git gl でグラフ表示
git config --global alias.gl 'log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative'
git config --global alias.gla 'log --graph --all --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit --date=relative'

# git difftoolでvimdiffを使ったdiffを表示する(git-diffとは別)
# git config --global diff.tool vimdiff
git config --global difftool.prompt false
# git config --global merge.tool vimdiff
# git config --global mergetool.prompt false

# git-diff時のタブを4スペースにする
git config --global core.pager 'less -x4'

# コミット時に差分も表示する
git config --global commit.verbose true

# コミット時のエディタ
# type code && git config --global core.editor 'code --wait' || git config --global core.editor vim
type lvim && git config --global core.editor lvim || git config --global core.editor vim

# globalなgitignoreを追加
git config --global core.excludesfile '~/.gitignore_global'

################################################################################
#
# zsh plugin manager sheldon
#

mkdir -p ~/.config/sheldon
ln -sf "$(realpath sheldon/plugins.toml)" ~/.config/sheldon

################################################################################
#
# zellij
#

mkdir -p ~/.config/zellij
ln -sf "$(realpath zellij/config.yaml)" ~/.config/zellij/config.yaml

################################################################################
#
# その他のツール
#

# .docker/config.jsonは認証情報が追記されシンボリックリンクにすると差分管理しづらいためファイルにする
if type jq > /dev/null; then
  # dockerコンテナ内で<C-p>2度押しを解消
  # https://qiita.com/Yuki-Inoue/items/60ec916383025160fbb8

  mkdir -p ~/.docker
  if [ -e ~/.docker/config.json ]; then
    mv -f ~/.docker/config.json ~/.docker/config.json.old
    cat ~/.docker/config.json.old | jq -s '.[0] * {"detachKeys": "ctrl-\\"}' > ~/.docker/config.json
  else
    echo '{"detachKeys": "ctrl-\\"}' > ~/.docker/config.json
  fi
fi

# gpgのシークレット入力プロンプトをシンプルなものに変更する(OSによりpinentry-ttyのパスが違う)
mkdir -p ~/.gnupg
case $(uname) in
  Linux)
    ln -sf "$(realpath gnupg/linux_gpg-agent.conf)" ~/.gnupg/gpg-agent.conf
    ;;
  Darwin)
    # brew --prefixの値が違うため
    case $(uname -m) in
      arm64)
        ln -sf "$(realpath gnupg/mac_arm64_gpg-agent.conf)" ~/.gnupg/gpg-agent.conf;;
      x86_64)
        ln -sf "$(realpath gnupg/mac_x86_64_gpg-agent.conf)" ~/.gnupg/gpg-agent.conf;;
    esac
    ;;
  *)
    ;;
esac

# alacritty
mkdir -p ~/.config/alacritty
ln -sf "$(realpath alacritty/alacritty.toml)" ~/.config/alacritty/

mkdir -p ~/.config/alacritty/themes
file -d ~/.config/alacritty/themes/.git || git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

# wezterm linuxで日本語入力不可
mkdir -p ~/.config/wezterm
ln -sf "$(realpath wezterm/wezterm.lua)" ~/.config/wezterm/

# kitty weztermのようなターミナル
mkdir -p ~/.config/kitty
ln -sf "$(realpath kitty/kitty.conf)" ~/.config/kitty/
ln -sf "$(realpath kitty/gruvbox_dark.conf)" ~/.config/kitty/

# cui file manager
mkdir -p ~/.config/lf
ln -sf "$(realpath lf/lfrc)" ~/.config/lf/

mkdir -p ~/.config/luaformatter
ln -sf "$(realpath luaformatter/config.yaml)" ~/.config/luaformatter/

mkdir -p ~/.config/gitui
ln -sf "$(realpath gitui/key_bindings.ron)" ~/.config/gitui/
