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
	ln -sf $(CURDIR)/settings.json ~/Library/Application Support/Code/User/settings.json
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

# スペルチェック
	code --install-extension streetsidesoftware.code-spell-checker

# rest client
	code --install-extension humao.rest-client
