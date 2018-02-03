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




# http://pocke.hatenablog.com/entry/2017/03/31/155345
# importしていないものも補完する
gocode close
sleep 1
gocode set unimported-packages true
gocode set

# デバッガ(macは最新パッチ版でないと使えない)
# http://qiita.com/iktakahiro/items/146a1218cbf451f75827
go get -v -u github.com/derekparker/delve/cmd/dlv

# ymlで書けるmakeのようなもの
go get -u -v github.com/go-task/task/cmd/task

# bundlerと被るので削除
rm -rf $GOPATH/bin/bundle
