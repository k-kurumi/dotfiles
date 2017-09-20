#!/bin/bash

port=${1:-8000}

echo ">>> listen ${port}"

while true
do
  {
    echo -e "HTTP/1.1 200 OK\r\n"
    echo "hello, netcat server."
  } | nc -l "${port}"
done
