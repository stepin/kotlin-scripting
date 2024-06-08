#!/usr/bin/env bash
cd "$(dirname "$0")"
set -x

# run inline script
docker run --rm -i stepin/kotlin-scripting -e 'println("Hello, world!")'

# run script from file
# NOTE: interactive scripts will not work in this case
docker run --rm -i stepin/kotlin-scripting - < simple.main.kts

# run script from file for interactive case
docker run --rm -it \
  -v "$(PWD):/data" \
  -w /data \
  stepin/kotlin-scripting \
  simple.main.kts

# interactive shell
docker run --rm -i stepin/kotlin-scripting
