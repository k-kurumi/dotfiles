#!/bin/bash -ex
#
# dotfileを置き換え

temp="/tmp/dotfiles_`date '+%s'`"
mkdir -p $temp

echo ".Xmodmap
.ackrc
.ctags
.eslintrc.yml
.gitignore_global
.ideavimrc
.peco
.pryrc
.railsrc
.screenrc
.hyper.js
.tigrc
.tmux.conf
.tmux.linux.conf
.tmux.mac.conf
.zshrc2
.rdb.sh
.tool.sh
.ptconfig.toml
.vimrc" | while read f
do
  [ -f ${HOME}/${f} ] && mv ${HOME}/${f} ${temp}
  ln -sf `pwd`/$f $HOME
done

# ghqの設定
mkdir -p ~/dev/src
mkdir -p ~/dev/bin

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

# globalなgitignoreを追加
if ! grep 'excludesfile =' ~/.gitconfig > /dev/null; then
  cat << 'EOL' >> ~/.gitconfig
[core]
  excludesfile = ~/.gitignore_global
EOL
fi

# preztoの設定ファイルに置き換え
# readmeの手順をbashで実現したもの
# https://github.com/sorin-ionescu/prezto
while read rcfile
do
  ln -sf ${rcfile} ~/.$(basename ${rcfile})
done < <(find "${ZDOTDIR:-$HOME}/.zprezto/runcoms" -maxdepth 1 -type f -name 'z*')

# 設定の追加分
grep .zshrc2 ~/.zshrc
if [ $? -ne 0 ]; then
  echo 'source ${HOME}/.zshrc2' >> ~/.zshrc
fi

# yamllintのconfig
mkdir -p ~/.config/yamllint
ln -sf "$(readlink -f .config/yamllint/config)" ~/.config/yamllint/

# zathura pdf reader
mkdir -p ~/.config/zathura
ln -sf "$(readlink -f .config/zathura/zathurarc)" ~/.config/zathura/

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

mkdir -p ~/dev/bin
cp bin/nc_server.sh ~/dev/bin

# gpgでgktウインドウがでてフォーカスが取られて面倒なのでCUIで完結するようにする
mkdir -p ~/.gnupg
ln -sf "$(readlink -f .gnupg/gpg-agent.conf)" ~/.gnupg/
