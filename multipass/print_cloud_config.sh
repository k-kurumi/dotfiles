#!/bin/bash
#
# multipassで使用するcloud-initを表示する
#
# [Module reference - cloud-init 22.4.2 documentation](https://cloudinit.readthedocs.io/en/latest/reference/modules.html)
#

set -eu

cat <<EOL
#cloud-config

timezone: Asia/Tokyo
locale: en_US.UTF-8
package_upgrade: true

# デフォルトのpackagesを上書きしているようにみえる
# 起動後に手動でインストールした方がよい
# packages:
#   - docker-compose-plugin

ssh_authorized_keys:
$(curl -s https://github.com/k-kurumi.keys | sed -e 's/^/  - /')
EOL
