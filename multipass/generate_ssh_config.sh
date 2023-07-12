#!/bin/bash
#
# multipassで起動中のvm用ssh_configを生成する
#

set -eu

multipass list | awk '$2 = /Running/{
  print "Host", $1
  print "  HostName", $3
  print "  User ubuntu"
  print "  Port 22"
  print "  ForwardAgent yes"
  print "  IdentityFile ~/.ssh/id_ed25519"
  print "  IdentityFile ~/.ssh/id_rsa"
  print "  StrictHostKeyChecking no"
  print "  UserKnownHostsFile /dev/null"
  print ""
}' > ssh_config
