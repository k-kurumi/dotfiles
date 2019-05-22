#!/bin/bash -x

type code || exit 1

# 設定ファイルの置き換え
case $(uname) in
  Darwin)
    ln -sf $(pwd)/settings.json "${HOME}/Library/Application Support/Code/User/settings.json"
    ;;
  Linux)
    ln -sf $(pwd)/settings.json "${HOME}/.config/Code/User/settings.json"
    ln -sf $(pwd)/keybindings.json "${HOME}/.config/Code/User/keybindings.json"
    ;;
  *)
    exit 1
esac

# プラグイン一覧の確認
# code --list-extensions

# uninstall all extensions
# code --list-extensions | xargs -I@ code --uninstall-extension @

# markdownの目次生成
code --install-extension AlanWalk.markdown-toc

# 標準のより使いやすいmarkdown表示
code --install-extension shd101wyy.markdown-preview-enhanced

# docker
code --install-extension PeterJausovec.vscode-docker

# ペアプロ
# code --install-extension ms-vsliveshare.vsliveshare

# golang
code --install-extension ms-vscode.Go

# vim kyebind
code --install-extension vscodevim.vim

# js系の整形ほか
code --install-extension esbenp.prettier-vscode
code --install-extension dbaeumer.vscode-eslint

# テーマ
code --install-extension dracula-theme.theme-dracula

# アイコン
code --install-extension PKief.material-icon-theme


# 日本語の折り返し補助
code --install-extension MS-CEINTL.vscode-language-pack-ja

# インデント強調
code --install-extension oderwat.indent-rainbow

# 不要なスペースなど強調
code --install-extension DmitryDorofeev.empty-indent

# 括弧の色付け
code --install-extension CoenraadS.bracket-pair-colorizer

# markdownなどのテーブル整形
code --install-extension shuworks.vscode-table-formatter

# git
code --install-extension eamodio.gitlens
