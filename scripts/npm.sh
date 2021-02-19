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
  vercel
)

echo "
╔══════════════════════════════════════════════╗
║   Configuring Node.js  🔧                    ║
╚══════════════════════════════════════════════╝
"
source 
mkdir ~/.oh-my-zsh/plugins/fnm
fnm completions --shell zsh >> ~/.oh-my-zsh/plugins/fnm/_fnm
fnm install --lts
fnm use lts-latest

echo "
╔══════════════════════════════════════════════╗
║   Installing NPM Modules 🏗️                  ║
╚══════════════════════════════════════════════╝
"
install 'npm install --global' ${npms[@]}
