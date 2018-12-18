#!/bin/bash
#
# golangを使う上で必要なツール一式をインストールする

echo "### コード補完"
# 本家(nsf)がメンテ終了のためfork版(mdempsky)を使う
# go get -u -v github.com/nsf/gocode

# 本家よりオプションが減っていて set unimported-packages などない
# importしてないファイルから補完ができなくなった
# go get -u -v github.com/mdempsky/gocode

echo "### タグジャンプ(gdでジャンプする(ctagsは不要))"
go get -u -v github.com/rogpeppe/godef

echo "### タグ情報生成"
go get -u -v github.com/jstemmer/gotags

echo "### irbみたいなの"
go get -u -v github.com/motemen/gore

echo "### pretty print"
go get -u -v github.com/k0kubun/pp

echo "### ドキュメント"
go get -u -v golang.org/x/tools/cmd/godoc

echo "### import補完"
go get -u -v golang.org/x/tools/cmd/goimports

echo "### そのた便利ツール一式"
go get -u -v golang.org/x/tools/cmd/...

echo "### lint"
go get -u -v github.com/golang/lint/golint

echo "### godep"
go get -u -v github.com/tools/godep

echo "### godepに必要らしい"
go get -u -v github.com/kr/pretty
go get -u -v github.com/pmezard/go-difflib/difflib
go get -u -v github.com/gin-gonic/gin
go get -u -v github.com/kr/pretty
go get -u -v github.com/mattn/go-colorable
go get -u -v github.com/mattn/go-isatty
go get -u -v golang.org/x/sys/unix
go get -u -v gopkg.in/bluesuncorp/validator.v5

echo "### rspecみたいなの"
go get -u -v github.com/onsi/ginkgo/ginkgo
go get -u -v github.com/onsi/gomega

echo "### bundlerのようなもの"
go get -u -v github.com/Masterminds/glide

echo "### 今後はghq経由でcloneする"
go get -u -v github.com/motemen/ghq

echo "### vimで\gdからドキュメントを引くときに使う"
go get -u -v github.com/zmb3/gogetdoc

echo "### リネームツール"
go get -u -v github.com/laurent22/massren

echo "### 公式のバージョン固定ツール"
go get -u -v github.com/golang/dep/cmd/dep

# デバッガ(macは最新パッチ版でないと使えない)
# http://qiita.com/iktakahiro/items/146a1218cbf451f75827
go get -v -u github.com/derekparker/delve/cmd/dlv

# ymlで書けるmakeのようなもの
go get -u -v github.com/go-task/task/cmd/task

# バイナリエディタ
go get -u -v github.com/itchyny/bed/cmd/bed

# memolistよりmarkdownに特化している
go get -u -v github.com/mattn/memo

# watchdogのようにファイル更新を監視する
go get -u -v github.com/cespare/reflex

# コードの行数表示
go get -u -v github.com/hhatto/gocloc/cmd/gocloc

# ymlで変数を指定できるテンプレートコマンド
go get -u -v github.com/cbroglie/mustache

# vscodeで必要
# https://github.com/Microsoft/vscode-go/wiki/Go-tools-that-the-Go-extension-depends-on
go get -u -v github.com/ramya-rao-a/go-outline
go get -u -v github.com/acroca/go-symbols
go get -u -v github.com/mdempsky/gocode
go get -u -v github.com/rogpeppe/godef
go get -u -v golang.org/x/tools/cmd/godoc
go get -u -v github.com/zmb3/gogetdoc
go get -u -v golang.org/x/lint/golint
go get -u -v github.com/fatih/gomodifytags
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v sourcegraph.com/sqs/goreturns
go get -u -v golang.org/x/tools/cmd/goimports
go get -u -v github.com/cweill/gotests/...
go get -u -v golang.org/x/tools/cmd/guru
go get -u -v github.com/josharian/impl
go get -u -v github.com/haya14busa/goplay/cmd/goplay
go get -u -v github.com/uudashr/gopkgs/cmd/gopkgs
go get -u -v github.com/davidrjenni/reftools/cmd/fillstruct
go get -u -v github.com/alecthomas/gometalinter
gometalinter --install

# gocode開発終了に伴いできた公式のlsp
# https://mattn.kaoriya.net/software/lang/go/20181217000056.htm
go get -u -v golang.org/x/tools/cmd/golsp

# bundlerと被るので削除
rm -rf $GOPATH/bin/bundle
