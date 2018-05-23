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
