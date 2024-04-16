#!/bin/bash
#
# 標準のdevcontainerに個人的な設定をマージして表示するスクリプト
#

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <devcontainer.json> <merge.json>"
  exit 1
fi

# json to yaml
function j2y() {
  ruby -ryaml -rjson -e 'puts YAML.dump(JSON.load(ARGF.read))'
}
# yaml to json
function y2j() {
  ruby -ryaml -rjson -e 'puts JSON.pretty_generate(YAML.load(ARGF.read))'
}

base_json=$1
merge_json=$2

base_json_tmp=$(mktemp)
merge_json_tmp=$(mktemp)

# jqはjsoncを扱えないためコメントを消している
cat "${base_json}" | j2y | y2j > "${base_json_tmp}"
cat "${merge_json}" | j2y | y2j > "${merge_json_tmp}"

# これをリダイレクトしてdevcontainer.jsonとして保存する
jq -s '.[0] * .[1]' "${base_json_tmp}" "${merge_json_tmp}"
