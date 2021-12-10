#!/bin/bash

set +e

echo "
╔════════════════════════════════════════════════════════════════════════════════════════════╗
║  ╔══════════════════════════════════════════════════════════════════════════════════════╗  ║
║  ║                                                                                      ║  ║
║  ║                    ███╗   ██╗   ██╗   ██╗   ██████╗      ██████╗                     ║  ║
║  ║                    ████╗  ██║   ██║   ██║   ██╔══██╗    ██╔═══██╗                    ║  ║
║  ║                    ██╔██╗ ██║   ██║   ██║   ██████╔╝    ██║   ██║                    ║  ║
║  ║                    ██║╚██╗██║   ██║   ██║   ██╔══██╗    ██║   ██║                    ║  ║
║  ║                    ██║ ╚████║   ╚██████╔╝   ██║  ██║    ╚██████╔╝                    ║  ║
║  ║                    ╚═╝  ╚═══╝    ╚═════╝    ╚═╝  ╚═╝     ╚═════╝                     ║  ║
║  ║                                                                                      ║  ║
║  ╚══════════════════════════════════════════════════════════════════════════════════════╝  ║
╚════════════════════════════════════════════════════════════════════════════════════════════╝
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
curl -sSL https://raw.githubusercontent.com/nurodev/dots/macos/scripts/brew.sh | sh
curl -sSL https://raw.githubusercontent.com/nurodev/dots/macos/scripts/cargo.sh | sh
curl -sSL https://raw.githubusercontent.com/nurodev/dots/macos/scripts/fonts.sh | sh
curl -sSL https://raw.githubusercontent.com/nurodev/dots/macos/scripts/mas.sh | sh
curl -sSL https://raw.githubusercontent.com/nurodev/dots/macos/scripts/npm.sh | sh

echo "
╔══════════════════════════════════════════════╗
║   Configuring workspace 🖥️                    ║
╚══════════════════════════════════════════════╝
"
curl -sSL https://raw.githubusercontent.com/nurodev/dots/macos/scripts/workspace.sh | sh

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
║    - Discord                                 ║
║    - Figma                                   ║
║    - Ledger Live                             ║
║    - Linear                                  ║
║    - Microsoft Edge                          ║
║    - Notion                                  ║
║    - Slack                                   ║
║    - Spark                                   ║
║    - Spotify                                 ║
║    - Tower                                   ║
║    - Vercel                                  ║
║    - Wireguard                               ║
║                                              ║
╚══════════════════════════════════════════════╝
"

echo "
╔══════════════════════════════════════════════╗
║                                              ║
║   Configure 🔨                               ║
║    - iTerm2                                  ║
║    - Microsoft Edge                          ║
║    - Tower                                   ║
║    - Visual Studio Code                      ║
║                                              ║
╚══════════════════════════════════════════════╝
"
