#!/bin/bash
#
# pythonのvenv周りの初期設定スクリプト
#

if (( $# == 0 )); then
  echo "Usage: ${0} <python_version>"
  exit 1
fi

function init_asdf() {
  local version=${1}

  echo "setup: python ${version}"
  asdf install python "${version}"
  asdf local python "${version}"
}

function init_venv() {
  echo "setup: venv"
  python -m venv .venv
}

function init_direnv() {
  echo "setup: direnv"
  cat <<EOF > .envrc
if [[ -d ./.venv ]]; then
  source ./.venv/bin/activate
fi
EOF
}

################################################################################

init_asdf "${1}"

if [[ ! -d ./.venv ]]; then
  init_venv
fi

if [[ ! -f .envrc ]]; then
  init_direnv
  direnv allow
fi
