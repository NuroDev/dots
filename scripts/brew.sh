#!/bin/bash

export formulas=(
  bat
  cmake
  deno
  docker-compose
  ffmpeg
  gifski
  git
  hexyl
  imagemagick
  m-cli
  mas
  node
  premake
  rustup-init
  sampler
  ssh-copy-id
  starship
  tokei
  tree
  wget
  youtube-dl
  zsh
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

export casks=(
  brooklyn
  dbngin
  discord
  docker
  figma
  gog-galaxy
  iterm2
  ledger-live
  linear-linear
  microsoft-edge
  notion
  qlcolorcode
  qlimagesize
  qlmarkdown
  qlstephen
  quicklook-json
  raycast
  rocket
  slack
  spotify
  tableplus
  tower
  visual-studio-code
  wwdc
)

echo "
╔══════════════════════════════════════════════╗
║   Installing Brew Formulas 🍺                ║
╚══════════════════════════════════════════════╝
"
brew info ${brews[@]}
install 'brew install' ${formulas[@]}

echo "
╔══════════════════════════════════════════════╗
║   Installing Brew Casks 🍺                   ║
╚══════════════════════════════════════════════╝
"
brew tap caskroom/versions
brew cask info ${casks[@]}
install 'brew install --cask' ${casks[@]}
