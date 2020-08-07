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
║   Update ⬆️                                  ║
╚══════════════════════════════════════════════╝
"
sudo apt-get update -y

echo "
╔══════════════════════════════════════════════╗
║   Upgrade ⬆️                                 ║
╚══════════════════════════════════════════════╝
"
sudo apt-get upgrade
sudo apt-get update -y

echo "
╔══════════════════════════════════════════════╗
║   Install ZSH ⚡                             ║
╚══════════════════════════════════════════════╝
"
sudo apt-get install zsh -y

echo "
╔══════════════════════════════════════════════╗
║   Install Oh My ZSH 🚀                       ║
╚══════════════════════════════════════════════╝
"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "
╔══════════════════════════════════════════════╗
║   Configuring ZSH 🔧                         ║
╚══════════════════════════════════════════════╝
"

# Download `.zshrc` / `.zprofile` / `.aliases` / `.functions`
wget https://raw.githubusercontent.com/NuroDev/dots/linux/.zshrc -o ~/.zshrc
wget https://raw.githubusercontent.com/NuroDev/dots/linux/.zprofile -o ~/.zprofile
wget https://raw.githubusercontent.com/NuroDev/dots/linux/.aliases -o ~/.aliases
wget https://raw.githubusercontent.com/NuroDev/dots/linux/.functions -o ~/.functions

# Install ZSH `Starship` prompt
curl -fsSL https://starship.rs/install.sh | bash

# Install ZSH `spaceship` theme
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Install ZSH plugins (`zsh-autosuggestions`, `zsh-completions`, `zsh-syntax-highlighting`)
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "
╔══════════════════════════════════════════════╗
║   Install NVM (Node.js) 📦                   ║
╚══════════════════════════════════════════════╝
"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
nvm install node

echo "
╔══════════════════════════════════════════════╗
║   Install Rust 🦀                            ║
╚══════════════════════════════════════════════╝
"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

echo "
╔══════════════════════════════════════════════╗
║                   Done ✅                    ║
╚══════════════════════════════════════════════╝
"
