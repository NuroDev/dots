#!/bin/bash

export npms=(
  lock-cli
  npm
  public-ip-cli
  serve
  vercel
  yarn
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
