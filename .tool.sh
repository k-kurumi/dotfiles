#!/bin/bash
#
# ツール系まとめ

function httpd_rb() {
  local port=${1:-8000}
  ruby -run -e httpd . -p "${port}"
}

function httpd_py() {
  local port=${1:-8000}
  python -m SimpleHTTPServer "${port}"
}

function httpd() {
  httpd_rb "$@"
}

function countup() {
  # 時間が指定されていないとき何もしない
  [[ $# -eq 0 ]] && return
  local max=${1}
  local t=0
  while ((t < max))
  do
    ((t++))
    sleep 1
    echo -n "$t "
  done
}
