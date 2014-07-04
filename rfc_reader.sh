#!/bin/bash
# TODO: 判断最新的 RFC 编号

Usage() {
  echo "Usage: $0 RFC_NUM"
}

if [ $# != 1 ]
then
  Usage
  exit 1
fi

RFC_NUM=$1
curl -sq http://www.ietf.org/rfc/rfc${RFC_NUM}.txt | less
