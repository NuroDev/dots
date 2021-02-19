#!/bin/bash

export npms=(
  fast-cli
  is-online-cli 
  is-reachable-cli
  is-up-cli
  lock-cli
  npm
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
