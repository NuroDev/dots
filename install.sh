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
sudo apt-get upgrade -y
sudo apt-get update -y

echo "
╔══════════════════════════════════════════════╗
║   Adding Symlinks 🔗                         ║
╚══════════════════════════════════════════════╝
"
sudo ln -s /mnt/c/Users/nuro/ ~/win
sudo ln -s /mnt/c/Dev ~/dev

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

# Set ZSH as default shell
chsh -s $(which zsh)

# Add hush login file
touch ~/.hushlogin

# Download git config file
wget https://raw.githubusercontent.com/nurodev/dots/wsl/.gitconfig -O ~/.gitconfig

# Download `.zshrc` / `.zprofile` / `.aliases` / `.functions`
if [[ -f "~/.zshrc" ]]; then
    sudo rm -rf ~/.zshrc
fi
wget https://raw.githubusercontent.com/nurodev/dots/wsl/.zshrc -O ~/.zshrc
wget https://raw.githubusercontent.com/nurodev/dots/wsl/.zprofile -O ~/.zprofile
wget https://raw.githubusercontent.com/nurodev/dots/wsl/.aliases -O ~/.aliases
wget https://raw.githubusercontent.com/nurodev/dots/wsl/.functions -O ~/.functions

# Install ZSH `Starship` prompt
curl -fsSL https://starship.rs/install.sh | bash

# Install ZSH `spaceship` theme
# TODO: Kinda hacky fix but it works. Need to switch to ZSH straight after it's installed to get access to $ZSH_CUSTOM env
$ZSH_CUSTOM = "~/.oh-my-zsh/custom/"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" 
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Install ZSH plugins (`zsh-autosuggestions`, `zsh-completions`, `zsh-syntax-highlighting`)
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Remove unused bash files
rm -rf ~/.bashrc
rm -rf ~/.bash_logout
rm -rf ~/.bash_history

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
