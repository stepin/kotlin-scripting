#!/usr/bin/env bash
set -eEuo pipefail
cd "$(dirname "$0")"
set -x

kotlinc-native hello.kt -o hello -opt
chmod +x hello.kexe
mv hello.kexe hello

file hello
otool -L hello
