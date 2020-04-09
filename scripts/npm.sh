#!/bin/bash

export npms=(
  @vue/cli
  fast-cli
  is-online-cli 
  is-reachable-cli
  is-up-cli
  lock-cli
  npm
  prettier
  public-ip-cli
  serve
  speed-test
  yarn
)

echo "
╔══════════════════════════════════════════════╗
║   Installing NPM Modules 🏗️                  ║
╚══════════════════════════════════════════════╝
"
install 'npm install --global' ${npms[@]}
