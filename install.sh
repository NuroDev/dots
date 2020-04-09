#!/bin/bash

set +e

echo "
╔══════════════════════════════════════════════════════════════════╗
║  ╔════════════════════════════════════════════════════════════╗  ║
║  ║                                                            ║  ║
║  ║       ███╗   ██╗   ██╗   ██╗   ██████╗      ██████╗        ║  ║
║  ║       ████╗  ██║   ██║   ██║   ██╔══██╗    ██╔═══██╗       ║  ║
║  ║       ██╔██╗ ██║   ██║   ██║   ██████╔╝    ██║   ██║       ║  ║
║  ║       ██║╚██╗██║   ██║   ██║   ██╔══██╗    ██║   ██║       ║  ║
║  ║       ██║ ╚████║   ╚██████╔╝   ██║  ██║    ╚██████╔╝       ║  ║
║  ║       ╚═╝  ╚═══╝    ╚═════╝    ╚═╝  ╚═╝     ╚═════╝        ║  ║
║  ║                                                            ║  ║
║  ╚════════════════════════════════════════════════════════════╝  ║
╚══════════════════════════════════════════════════════════════════╝
"

echo "
╔══════════════════════════════════════════════╗
║   Installing Homebrew 🍺                     ║
╚══════════════════════════════════════════════╝
"

# Install Homebrew
if test ! $(which brew); then
  echo "
  ╔══════════════════════════════════════════════╗
  ║   Installing Xcode 🔨                        ║
  ╚══════════════════════════════════════════════╝
  "
  xcode-select --install

  echo "
  ╔══════════════════════════════════════════════╗
  ║   Installing Homebrew 🍺                     ║
  ╚══════════════════════════════════════════════╝
  "
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "
  ╔══════════════════════════════════════════════╗
  ║   Updating Homebrew ⬆️                        ║
  ╚══════════════════════════════════════════════╝
  "
  brew update
  brew upgrade
fi

function install {
  cmd=$1
  shift
  for pkg in $@;
  do
    exec="$cmd $pkg"
    echo "Execute: $exec"
    if ${exec} ; then
      echo "Installed $pkg"
    else
      echo "Failed to execute: $exec"
    fi
  done
}
export -f install

echo "
╔══════════════════════════════════════════════╗
║   Installing Packages ✨                     ║
╚══════════════════════════════════════════════╝
"
curl -sSL https://raw.githubusercontent.com/NuroDev/dots/master/scripts/brew.sh | sh
curl -sSL https://raw.githubusercontent.com/NuroDev/dots/master/scripts/cargo.sh | sh
curl -sSL https://raw.githubusercontent.com/NuroDev/dots/master/scripts/editor.sh | sh
curl -sSL https://raw.githubusercontent.com/NuroDev/dots/master/scripts/fonts.sh | sh
curl -sSL https://raw.githubusercontent.com/NuroDev/dots/master/scripts/mas.sh | sh
curl -sSL https://raw.githubusercontent.com/NuroDev/dots/master/scripts/npm.sh | sh

echo "
╔══════════════════════════════════════════════╗
║   Configuring workspace 🖥️                    ║
╚══════════════════════════════════════════════╝
"
curl -sSL https://raw.githubusercontent.com/NuroDev/dots/master/scripts/workspace.sh | sh

echo "
╔══════════════════════════════════════════════╗
║   Cleaning up 🗑                              ║
╚══════════════════════════════════════════════╝
"
brew cleanup
brew cask cleanup
npm prune -g

echo "
╔══════════════════════════════════════════════╗
║   Done ✅                                    ║
╚══════════════════════════════════════════════╝
"

echo "
╔══════════════════════════════════════════════╗
║                                              ║
║   Manual Steps ✅                            ║
║                                              ║
║   1)  Login: 1Password                       ║
║   2)  Login: Google Chrome                   ║
║   3)  Login: Spark (Email)                   ║
║   4)  Login: Spotify                         ║
║   5)  Login: Discord                         ║
║   6)  Login: Notion                          ║
║   7)  Login: Figma                           ║
║   8)  Login: GitHub (SSH)                    ║
║   8)  Login: GitKraken                       ║
║   9)  Login: Zeit Now                        ║
║   10) Login: Figma                           ║
║                                              ║
╚══════════════════════════════════════════════╝
"
