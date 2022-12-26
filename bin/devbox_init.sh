#!/bin/bash
#
# devbox shell 状態にする
# https://www.jetpack.io/devbox/docs/ide_configuration/direnv/
#

function init_direnv() {
  echo "setup: direnv"
  cat <<'EOF' > .envrc
use_devbox() {
  watch_file devbox.json
  eval $(devbox shell --print-env)
}
test -f devbox.json && use devbox
EOF
}

################################################################################

if [[ ! -f .envrc ]]; then
  init_direnv
fi
