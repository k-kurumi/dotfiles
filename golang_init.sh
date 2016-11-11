#!/bin/bash
#
# golangを使う上で必要なツール一式をインストールする

echo
echo ">>> コード補完"
go get -u -v github.com/nsf/gocode

echo
echo ">>> タグジャンプ(gdでジャンプする(ctagsは不要))"
go get -u -v github.com/rogpeppe/godef

echo
echo ">>> タグ情報生成"
go get -u -v github.com/jstemmer/gotags

echo
echo ">>> irbみたいなの"
go get -u -v github.com/motemen/gore

echo
echo ">>> pretty print"
go get -u -v github.com/k0kubun/pp

echo
echo ">>> ドキュメント"
go get -u -v golang.org/x/tools/cmd/godoc
echo

echo
echo "import補完"
go get -u -v golang.org/x/tools/cmd/goimports
echo

echo
echo ">>> godep"
go get -u -v github.com/tools/godep

echo "godepに必要らしい"
go get -u -v github.com/kr/pretty
go get -u -v github.com/pmezard/go-difflib/difflib
go get -u -v github.com/gin-gonic/gin
go get -u -v github.com/kr/pretty
go get -u -v github.com/mattn/go-colorable
go get -u -v github.com/mattn/go-isatty
go get -u -v golang.org/x/sys/unix
go get -u -v gopkg.in/bluesuncorp/validator.v5

echo
echo ">>> rspecみたいなの"
go get -u -v github.com/onsi/ginkgo/ginkgo
go get -u -v github.com/onsi/gomega


# glideはソースがgithubになるため消えることがありロックファイルの意味がないためgodepでソースまるごと持つほうがまし
