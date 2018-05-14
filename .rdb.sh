#!/bin/bash
#
# rdbのAPIまとめ

# keystone認証の途中経過も表示する
function rdb_auth {
  if [[ $# -ne 3 ]]; then
    >&2 echo "usage: $0 <region> <username> <password>"
    return
  fi

  region=$1
  username=$2
  password=$3

  curl -v -H "Content-Type: application/json" \
    -d '{
      "auth": {
        "identity": {
          "methods": ["password"],
          "password": {
            "user": {
              "domain": {
                "id": "default"
              },
              "name": "'${username}'",
              "password": "'${password}'"
            }
          }
        }
      }
  }' https://keystone-${region}-ecl.api.ntt.com/v3/auth/tokens
}

# keystone認証してtokenだけ表示する
function rdb_auth_token {
  if [[ $# -ne 3 ]]; then
    >&2 echo "usage: $0 <region> <username> <password>"
    return
  fi

  rdb_auth "$@" 2>&1 | awk '/X-Subject-Token:/{print $3}' | tr -d '\r'
}
