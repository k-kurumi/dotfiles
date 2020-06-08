OS := $(shell uname)

help:
	@echo "vscodeの初期設定用"

# 設定ファイルの作成
init:
ifeq ($(OS), Linux)
	ln -sf $(CURDIR)/settings.json ~/.config/Code/User/settings.json
	ln -sf $(CURDIR)/keybindings.json ~/.config/Code/User/keybindings.json
endif

ifeq ($(OS), Darwin)
# macでスペースがあるときはバックスラッシュが必要(クォートで囲んでもエラーになる)
	ln -sf $(CURDIR)/settings.json ~/Library/Application\ Support/Code/User/settings.json
endif

# プラグイン一覧
list:
	code --list-extensions

# 全削除
uninstall_all:
	code --list-extensions | xargs -I@ code --uninstall-extension @

# インストール
install_all:
# markdownの目次生成
	code --install-extension AlanWalk.markdown-toc

# 標準のより使いやすいmarkdown表示
	code --install-extension shd101wyy.markdown-preview-enhanced

# ペアプロ
# code --install-extension ms-vsliveshare.vsliveshare

# vim kyebind
	code --install-extension vscodevim.vim

# js系の整形ほか
	code --install-extension dbaeumer.vscode-eslint

# テーマ
	code --install-extension dracula-theme.theme-dracula
	code --install-extension Equinusocio.vsc-material-theme

# todoをハイライト
	code --install-extension wayou.vscode-todo-highlight

# RGB表記を色付け
	code --install-extension naumovs.color-highlight

# アイコン
	code --install-extension PKief.material-icon-theme

# 日本語の折り返し補助
	code --install-extension MS-CEINTL.vscode-language-pack-ja

# キーワードで色分け、インデント強調、行末スペースの色付けなど
# 色付けが多すぎて見づらいので使用しない
#	code --install-extension wraith13.background-phi-colors

# 括弧の色付け
	code --install-extension CoenraadS.bracket-pair-colorizer

# markdownなどのテーブル整形
	code --install-extension shuworks.vscode-table-formatter

# git
	code --install-extension eamodio.gitlens
	code --install-extension donjayamanne.githistory

# スペルチェック
	code --install-extension streetsidesoftware.code-spell-checker

# rest client
	code --install-extension humao.rest-client

# 整形
	code --install-extension wwm.better-align

# パスの補完
	code --install-extension christian-kohler.path-intellisense

# 閉じタグの補完
	code --install-extension formulahendry.auto-close-tag

# ghosttext
	code --install-extension tokoph.ghosttext

# draw.io
	code --install-extension hediet.vscode-drawio
