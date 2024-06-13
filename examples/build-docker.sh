#!/usr/bin/env bash
set -eEuo pipefail
cd "$(dirname "$0")"
set -x

docker build . -t kotlin-scripting-example

docker run --rm -i -v "$(PWD):/data" -w /data -u "$(id -u)" kotlin-scripting-example
