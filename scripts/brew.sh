#!/bin/bash

export formulas=(
  bat
  deno
  docker-compose
  fd
  ffmpeg
  ffsend
  gifski
  git
  gotop
  hexyl
  mas
  node
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
  brooklyn
  discord
  docker
  figma
  gitkraken
  google-chrome
  iterm2
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
  viscosity
  visual-studio-code
  webtorrent
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
