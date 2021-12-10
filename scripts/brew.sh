#!/bin/bash

export formulas=(
  act
  bat
  cmake
  colima
  deno
  docker
  docker-compose
  dog
  duf
  dust
  ffmpeg
  fnm
  gifski
  git
  go
  gping
  hexyl
  httpie
  imagemagick
  jq
  lazydocker
  lsd
  m-cli
  mas
  nano
  planetscale/tap/pscale
  premake
  rustup-init
  sampler
  spaceship
  ssh-copy-id
  starship
  tokei
  trash
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
  figma
  iina
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
