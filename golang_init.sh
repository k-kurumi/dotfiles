#!/bin/bash
#
# golangを使う上で必要なツール一式をインストールする

echo "### コード補完"
go get -u -v github.com/nsf/gocode

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
go get -u -v github.com/golang/dep
