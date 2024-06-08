#!/usr/bin/env bash
set -eEuo pipefail
cd "$(dirname "$0")"
set -x

awk '{ print $3 "\t" $2;}' example.tsv

kotlin -e 'generateSequence(::readlnOrNull).forEach{ val f = it.split("\t"); println("${f[2]}\t${f[1]}") }' -- - < example.tsv

kscript -t 'lines.split().select(3,2).print()' example.tsv
