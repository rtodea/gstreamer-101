#!/bin/bash

function main() {
  echo "Running entrypoint.sh"
}

main

# we need this for CLion Docker Toolchain
bash -c "$@"
