#!/bin/bash
#
# multipass管理VMのinventory.iniを表示する
#

set -eu

(( $# < 1 )) && echo "Usage: $0 <vm_name>" && exit 1

vm_name=$1

multipass list | awk '$1 == "'"${vm_name}"'"{
  print "[vms]"
  print $1, "ansible_user=ubuntu ansible_connection=ssh ansible_port=22 ansible_host="$3
}' #> ssh_config
