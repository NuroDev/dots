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
packages = (
  brew
  cargo
  editor
  fonts
  mas
  npm
)
curl -sSL https://raw.githubusercontent.com/nurodev/dots/master/scripts/${packages[@]}.sh | sh

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
║                   Done ✅                    ║
╚══════════════════════════════════════════════╝
"

echo "
╔══════════════════════════════════════════════╗
║                                              ║
║   Login 🔒                                   ║
║    - 1Password                               ║
║    - Microsoft Edge                          ║
║    - Spark (Email)                           ║
║    - Spotify                                 ║
║    - Discord                                 ║
║    - Notion                                  ║
║    - Figma                                   ║
║    - GitHub (SSH)                            ║
║    - GitKraken                               ║
║    - Zeit Now                                ║
║    - GOG Galaxy                              ║
║                                              ║
╚══════════════════════════════════════════════╝
"

echo "
╔══════════════════════════════════════════════╗
║                                              ║
║   Configure 🔨                               ║
║    - iTerm2                                  ║
║    - Visual Studio Code                      ║
║    - iTerm2                                  ║
║    - iTerm2                                  ║
║    - iTerm2                                  ║
║    - iTerm2                                  ║
║                                              ║
╚══════════════════════════════════════════════╝
"
