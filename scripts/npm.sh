#!/bin/bash

export npms=(
  fast-cli
  is-online-cli
  is-up-cli
  lock-cli
  npm
  public-ip-cli
  serve
  speed-test
  yarn
  vdx
)

echo "
╔══════════════════════════════════════════════╗
║   Installing NPM Modules 🏗️                  ║
╚══════════════════════════════════════════════╝
"
install 'npm install --global' ${npms[@]}
