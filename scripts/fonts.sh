#!/bin/bash

export fonts=(
  font-fira-code
  font-montserrat
  font-open-sans
  font-open-sans-condensed
  font-raleway
  font-roboto
  font-roboto-condensed
  font-sanfrancisco
  font-quicksand
)

echo "
╔══════════════════════════════════════════════╗
║   Installing Fonts ℬ                         ║
╚══════════════════════════════════════════════╝
"
brew tap caskroom/fonts
install 'brew cask install' ${fonts[@]}
