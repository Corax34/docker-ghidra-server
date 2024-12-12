#!/bin/bash

set -e

if [ "$1" = 'server' ]; then
  shift
  # Figure out public address
  export GHIDRA_PUBLIC_HOSTNAME=${GHIDRA_PUBLIC_HOSTNAME:-$(dig +short myip.opendns.com @resolver1.opendns.com)}

  exec "/ghidra/server/ghidraSvr" console
fi

exec "$@"
