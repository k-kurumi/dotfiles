#!/bin/bash
#
# 設定ファイルなどの初期設定

set -x
set -eu

tmp_dir=$(mktemp -d)

echo ".Xmodmap
.ackrc
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
.rdb.sh
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

# nvim固有の設定が増えてきて条件分岐が多くなってきたため、設定ファイルを分けた
mkdir -p ~/.config/nvim
# ln -sf "$(realpath nvim/init.vim)" ~/.config/nvim/init.vim
ln -sf "$(realpath nvim/init.lua)" ~/.config/nvim/init.lua

# プラグインマネージャ https://github.com/tani/vim-jetpack
curl -fLo ~/.config/nvim/plugin/jetpack.vim --create-dirs https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim

# coc
ln -sf "$(realpath nvim/coc-settings.json)" ~/.config/nvim/coc-settings.json

mkdir -p ~/.config/coc
ln -sf "$(realpath coc/ultisnips)" ~/.config/coc

################################################################################
#
# git
#

# ghqが使用するフォルダ
mkdir -p ~/dev/src
mkdir -p ~/dev/bin

git config --global user.name k-kurumi
git config --global user.email optpia.kurumi@gmail.com

touch ~/.gitconfig
if ! grep ghq ~/.gitconfig > /dev/null; then
  cat << 'EOL' >> ~/.gitconfig
[ghq]
  root = ~/dev/src
EOL
fi

# git gl でグラフ表示
if ! grep 'gla =' ~/.gitconfig > /dev/null; then
  cat << 'EOL' >> ~/.gitconfig
[alias]
  gl  = log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative
  gla = log --graph --all --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative
EOL
fi

# git difftoolでvimdiffを使ったdiffを表示する(git-diffとは別)
git config --global diff.tool vimdiff
git config --global difftool.prompt false
# git config --global merge.tool vimdiff
# git config --global mergetool.prompt false

# git-diff時のタブを4スペースにする
git config --global core.pager 'less -x4'

# globalなgitignoreを追加
if ! grep 'excludesfile =' ~/.gitconfig > /dev/null; then
  cat << 'EOL' >> ~/.gitconfig
[core]
  excludesfile = ~/.gitignore_global
EOL
fi

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

# yamllintの設定ファイル
mkdir -p ~/.config/yamllint
ln -sf "$(realpath .config/yamllint/config)" ~/.config/yamllint/

# zathura vi風のPDFリーダー設定ファイル
mkdir -p ~/.config/zathura
ln -sf "$(realpath .config/zathura/zathurarc)" ~/.config/zathura/

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

# wezterm 日本語変換途中が表示されないがそれ以外は問題なく使える
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

# デバッグツール周り
mkdir -p ~/dev/bin
cp bin/nc_server.sh ~/dev/bin
