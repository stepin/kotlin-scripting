#!/usr/bin/env bash

if [[ $# -eq 0 ]]; then
  # interactive shell case
  kotlin
else
  # put script into file to make it main.kts, not just kts (allows external dependencies and so on)
  if [[ "$1" == "-" ]]; then
    cp /dev/stdin /tmp/script.main.kts
    set -- /tmp/script.main.kts "${@:2}"
  fi
  kotlin "$@"
fi
