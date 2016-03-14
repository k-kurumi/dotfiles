#!/bin/bash
#
# golangを使う上で必要なツール一式をインストールする

echo ">>> コード補完"
go get -u -v github.com/nsf/gocode

echo ">>> タグジャンプ(gdでジャンプする(ctagsは不要))"
go get -u -v github.com/rogpeppe/godef

echo ">>> タグ情報生成"
go get -u -v github.com/jstemmer/gotags

echo ">>> irbみたいなの"
go get -u -v github.com/motemen/gore

echo ">>> pretty print"
go get -u -v github.com/k0kubun/pp

echo ">>> ドキュメント"
go get -u -v golang.org/x/tools/cmd/godoc

echo "import補完"
go get -u -v golang.org/x/tools/cmd/goimports

echo ">>> godep"
go get -u -v github.com/tools/godep
