#!/bin/bash

export formulas=(
  bat
  cmake
  deno
  docker-compose
  fd
  ffmpeg
  ffsend
  gifski
  git
  hexyl
  imagemagick
  m-cli
  mas
  node
  premake
  rustup-init
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
  apple-events
  beekeeper-studio
  brooklyn
  discord
  docker
  figma
  gog-galaxy
  iterm2
  ledger-live
  linear-linear
  microsoft-edge
  notion
  now
  qlcolorcode
  qlimagesize
  qlmarkdown
  qlstephen
  quicklook-json
  rocket
  slack
  spotify
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
install 'brew cask install' ${casks[@]}
