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
curl -sSL https://raw.githubusercontent.com/nurodev/dots/master/scripts/brew.sh | sh
curl -sSL https://raw.githubusercontent.com/nurodev/dots/master/scripts/cargo.sh | sh
curl -sSL https://raw.githubusercontent.com/nurodev/dots/master/scripts/editor.sh | sh
curl -sSL https://raw.githubusercontent.com/nurodev/dots/master/scripts/fonts.sh | sh
curl -sSL https://raw.githubusercontent.com/nurodev/dots/master/scripts/mas.sh | sh
curl -sSL https://raw.githubusercontent.com/nurodev/dots/master/scripts/npm.sh | sh

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
║    - Spark                                   ║
║    - Spotify                                 ║
║    - Slack                                   ║
║    - Discord                                 ║
║    - Telegram                                ║
║    - Sketch                                  ║
║    - Figma                                   ║
║    - Notion                                  ║
║    - Ledger Live                             ║
║    - Linear                                  ║
║    - GitHub                                  ║
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
║    - Microsoft Edge                          ║
║    - iTerm2                                  ║
║    - Visual Studio Code                      ║
║    - Gitkraken                               ║
║    - Docker                                  ║
║    - Viscocity                               ║
║    - Dato                                    ║
║                                              ║
╚══════════════════════════════════════════════╝
"
