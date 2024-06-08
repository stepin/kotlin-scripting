#!/usr/bin/env bash
set -eEuo pipefail
cd "$(dirname "$0")"
set -x

docker build . -t kotlin-scripting-example

docker run --rm -i kotlin-scripting-example
