#!/bin/bash
#
# multipassで起動中のNameを指定してssh_configを表示する
#

set -eu

(( $# < 1 )) && echo "Usage: $0 <vm_name>" && exit 1

vm_name=$1

multipass list | awk '$1 == "'"${vm_name}"'"{
  print "Host", $1
  print "  HostName", $3
  print "  User ubuntu"
  print "  Port 22"
  print "  ForwardAgent yes"
  print "  IdentityFile ~/.ssh/id_ed25519"
  print "  StrictHostKeyChecking no"
  print "  UserKnownHostsFile /dev/null"
}'
