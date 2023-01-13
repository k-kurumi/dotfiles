#!/bin/bash
#
# python+poetryのkvenv周りの初期設定スクリプト
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

  poetry_version=$(asdf list all poetry | tail -1)
  asdf install poetry "${poetry_version}"
  asdf local poetry "${poetry_version}"
}

function init_poetry() {
  echo "setup: poetry"
  poetry init --no-interaction
  poetry install
}

function init_direnv() {
  echo "setup: direnv"
  cat <<'EOF' > .envrc
## [Python · direnv/direnv Wiki](https://github.com/direnv/direnv/wiki/Python#poetry)
layout_poetry() {
  PYPROJECT_TOML="${PYPROJECT_TOML:-pyproject.toml}"
  if [[ ! -f "$PYPROJECT_TOML" ]]; then
    log_status "No pyproject.toml found. Executing \`poetry init\` to create a \`$PYPROJECT_TOML\` first."
    poetry init
  fi

  if [[ -d ".venv" ]]; then
    VIRTUAL_ENV="$(pwd)/.venv"
  else
    VIRTUAL_ENV=$(poetry env info --path 2>/dev/null ; true)
  fi

  if [[ -z $VIRTUAL_ENV || ! -d $VIRTUAL_ENV ]]; then
    log_status "No virtual environment exists. Executing \`poetry install\` to create one."
    poetry install
    VIRTUAL_ENV=$(poetry env info --path)
  fi

  PATH_add "$VIRTUAL_ENV/bin"
  export POETRY_ACTIVE=1
  export VIRTUAL_ENV
}
layout_poetry
EOF
}

################################################################################

init_asdf "${1}"

if [[ ! -f ./pyproject.toml ]]; then
  init_poetry
fi

if [[ ! -f .envrc ]]; then
  init_direnv
  direnv allow
fi
