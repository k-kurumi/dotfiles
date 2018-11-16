#!/bin/bash -x

type code || exit 1

# 設定ファイルの置き換え
case $(uname) in
  Darwin)
    ln -sf $(pwd)/settings.json "${HOME}/Library/Application Support/Code/User/settings.json"
    ;;
  Linux)
    ln -sf $(pwd)/settings.json "${HOME}/.config/Code/User/settings.json"
    ;;
  *)
    exit 1
esac

# プラグイン一覧の確認
# code --list-extensions
code --install-extension AlanWalk.markdown-toc
code --install-extension DmitryDorofeev.empty-indent
code --install-extension MS-CEINTL.vscode-language-pack-ja
code --install-extension PeterJausovec.vscode-docker
code --install-extension SirTori.indenticator
code --install-extension castwide.solargraph
code --install-extension dbaeumer.vscode-eslint
code --install-extension emmanuelbeziat.vscode-great-icons
code --install-extension gcazaciuc.vscode-flow-ide
code --install-extension idleberg.hopscotch
code --install-extension ms-vscode.Go
code --install-extension ms-vsliveshare.vsliveshare
code --install-extension rebornix.Ruby
code --install-extension rogalmic.bash-debug
code --install-extension vscodevim.vim
code --install-extension wyze.theme-hybrid-next
code --install-extension esbenp.prettier-vscode
