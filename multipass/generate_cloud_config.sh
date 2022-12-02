#!/bin/bash
#
# multipassで使用するcloud-config.yamlを生成する
#

set -eu

cat <<EOF > cloud-config.yaml
---
timezone: Asia/Tokyo
locale: en_US.UTF-8
package_upgrade: true

# デフォルトのpackagesを上書きしているようにみえる
# 起動後に手動でインストールした方がよい
# packages:
#   - docker-compose-plugin

ssh_authorized_keys:
$(curl -s https://github.com/k-kurumi.keys | sed -e 's/^/  - /')
EOF
