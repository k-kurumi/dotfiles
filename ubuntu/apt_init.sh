#!/bin/bash
#
# ubuntuインストール後のGUIツールなどまとめ

sudo apt-get purge nano

# Xがなければ終了
test -z $DISPLAY && exit 0

sudo apt update

package_list=$(tempfile)

# インストールするツール一式
cat << EOF > ${package_list}
coreutils # 開発用ツール
exuberant-ctags # ctags
asunder   # CDのflackリッピング
zathura   # vim風pdf reader
geeqie    # 類似画像検索
gthumb    # 画像ビューア
screenkey # 入力キーを画面表示
dconf-editor # X系の設定エディタ
EOF

while read pkg
do
  # 後ろのコメントを削除してインストー ル
  # echo ${pkg%%#*}
  sudo apt-get install -y ${pkg%%#*}
done < <(cat ${package_list})

rm -f ${package_list}

# emacs風keybind
# xfce4-settings-editor -> xsettings -> KeyThemeName を Emacs にする。(再起動などは不要で即使える)
# http://hidemon-memo.blogspot.com/2014/06/xubuntu-xfce4-emacs.html

# intellijで日本語をインライン変換する
# Fcitxの[設定]-[アドオン]-[拡張]（チェック）-[Fcitx XIM Frontend]-[設定]-[XIMでOn The Spotスタイルを使う(起動中は変更できません)]（チェック）-[OK]で、Fcitxの[再起動]
# https://qiita.com/Huruikagi/items/4651696a0b9bba00c992
