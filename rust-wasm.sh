#!/bin/bash

# https://gist.github.com/LukasKalbertodt/821ab8b85a25f4c54544cc43bed2c39f

# Super simple script to compile Rust to wasm. Usage:
# ./rust-wasm.sh foo.rs

if [ -z ${1+x} ]; then
  echo "missing argument: rust source file"
  exit 1
fi

BASENAME="${1%.rs}"

INPUT="${BASENAME}.rs"

if [ ! -f "${INPUT}" ]; then
  echo "File not found: ${INPUT}"
  exit 2
fi

rustc -O --target=wasm32-unknown-unknown "${INPUT}" && \
  wasm-gc "${BASENAME}.wasm" "${BASENAME}-gc.wasm"
