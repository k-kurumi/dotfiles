#!/bin/bash
#
# multipassで使用するcloud-initを生成する
#
# [Module reference - cloud-init 22.4.2 documentation](https://cloudinit.readthedocs.io/en/latest/reference/modules.html)
#

set -eu

cat <<EOF > cloud_init.yml
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
