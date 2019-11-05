#!/usr/bin/env bash

# Brew Packages
brews=(
  bat
  docker
  docker-compose
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
  tree
  wget
  zsh
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

# Brew Cask Apps
casks=(
  discord
  figma
  gitkraken
  google-chrome
  iterm2
  now
  notion
  qlcolorcode
  qlstephen
  qlmarkdown
  quicklook-json
  qlimagesize
  rocket
  sketch
  slack
  spotify
  webtorrent
  visual-studio-code
)

# Mac App Store Apps
mas_apps=(
  1333542190 # 1Password
  1351639930 # Gifski
  1176895641 # Spark
  1153157709 # Speedtest
  497799835 # Xcode
)

# NPM Global Packages
npms=(
  @vue/cli
  fast-cli
  is-online-cli 
  is-reachable-cli
  is-up-cli
  lock-cli
  npm
  prettier
  public-ip-cli
  serve
  speed-test
  yarn
)

# Cargo crates
crates=(
  rustfmt
  tock
  wasm-pack
)

# Rust toolchain
rust_toolchain=nightly

# Rustup components
rustup_components=(
  rls-preview
  rust-analysis
  rust-src
)

# Visual Studio Code Extensions
vscode=(
  bungcip.better-toml # Better .toml support
  coenraads.bracket-pair-colorizer # Bracket pair colorizer
  ms-vscode.cpptools # C++ tools
  ms-vscode.csharp # C# tools
  icrawl.discord-vscode # Discord integration
  peterjausovec.vscode-docker # Docker integration
  wix.vscode-import-cost # Import cost
  sirtori.indenticator # Indenticator
  eg2.vscode-npm-script # NPM integration
  christian-kohler.npm-intellisense # NPM Intellisense
  zhuangtongfa.Material-theme # One Dark Pro theme
  ms-vscode-remote.remote-ssh # Remote SSH
  rust-lang.rust # Rust lang support
  Shan.code-settings-sync # Settings Sync
  cssho.vscode-svgviewer # SVG viewer
  wayou.vscode-todo-highlight # TODO highlighter
  ms-vscode.vscode-typescript-tslint-plugin # Typescript linting
  octref.vetur # VueJS support
  shyykoserhiy.vscode-spotify # Spotify integration
)

# System fonts
fonts=(
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

# --- End of app list ---

# --- Install everthing ---
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
  ║   Updating Homebrew ⬇️                        ║
  ╚══════════════════════════════════════════════╝
  "
  brew update
  brew upgrade
fi

# Tap additional services
brew tap homebrew/services
brew tap caskroom/cask
brew tap caskroom/drivers
brew tap caskroom/versions 
brew tap caskroom/fonts
brew tap cjbassi/gotop
brew tap gerrit/homebrew-fonts-sanfrancisco

# Cleanup
brew doctor
brew tap homebrew/dupes

# Basic install function
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

# Generate new SSH key if one doesn't already exist
if test ! $([ -d "~/.ssh/" ]); then
  echo "
  ╔══════════════════════════════════════════════╗
  ║   SSH key already generated ✨               ║
  ╚══════════════════════════════════════════════╝
  "
else
  echo "
  ╔══════════════════════════════════════════════╗
  ║   Generating SSH Key ✨                      ║
  ╚══════════════════════════════════════════════╝
  "
  mkdir -p ~/.ssh/ # Create .ssh dir
  chmod 700 ~/.ssh/ # Chmod .ssh dir
  ssh-keygen # Generate ssh key
fi

# Configure Rustup
echo "
╔══════════════════════════════════════════════╗
║   Configuring Rust 🦀                        ║
╚══════════════════════════════════════════════╝
"
rustup self update
rustup update
rustup install ${rust_toolchain}
rustup default ${rust_toolchain}

# Installing all packages/services/apps
echo "
╔══════════════════════════════════════════════╗
║   Installing Packages ✨                     ║
╚══════════════════════════════════════════════╝
"

# Install formulas
echo "
╔══════════════════════════════════════════════╗
║   Installing Brew Formulas 🍺                ║
╚══════════════════════════════════════════════╝
"
brew info ${brews[@]}
install 'brew install' ${brews[@]}

# Install casks
echo "
╔══════════════════════════════════════════════╗
║   Installing Brew Casks 🍺                   ║
╚══════════════════════════════════════════════╝
"
brew tap caskroom/versions
brew cask info ${casks[@]}
install 'brew cask install' ${casks[@]}

# Install Mac App store apps
echo "
╔══════════════════════════════════════════════╗
║   Installing MAS Apps 🍎                     ║
╚══════════════════════════════════════════════╝
"
install 'mas install' ${mas_apps[@]}

# Install Oh-My-Zsh
echo "
╔══════════════════════════════════════════════╗
║   Installing Oh-My-Zsh ⚡️                    ║
╚══════════════════════════════════════════════╝
"

sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

if test ! $(which zsh); then
  export PATH="/usr/local/bin:/usr/local/sbin:$PATH" # Set path declaration to zsh profile
  chsh -s /usr/local/bin/zsh # Set ZSH as default shell
fi

echo "
╔══════════════════════════════════════════════╗
║   Configuring ZSH ⚡️                         ║
╚══════════════════════════════════════════════╝
"

# Download zshrc config
rm -rf ~/.zshrc
wget https://gist.githubusercontent.com/NuroDev/fa3dcac6837276c60eece052a3b91980/raw/965f23a16d26ae71930ce0d4abb2f729f870154e/.zshrc -O ~/.zshrc

# Install NPM packages
echo "
╔══════════════════════════════════════════════╗
║   Installing NPM Modules 🏗️                  ║
╚══════════════════════════════════════════════╝
"
install 'npm install --global' ${npms[@]}

# Install Cargo crates
echo "
╔══════════════════════════════════════════════╗
║   Installing Cargo Crates 📦                 ║
╚══════════════════════════════════════════════╝
"
install 'cargo install' ${crates[@]}

# Install Rustup components
echo "
╔══════════════════════════════════════════════╗
║   Installing Rustup Components 📦            ║
╚══════════════════════════════════════════════╝
"
install 'rustup component add' ${rustup_components[@]}

# Install VSCode extensions
echo "
╔══════════════════════════════════════════════╗
║   Installing VS Code Extensions ⌨️            ║
╚══════════════════════════════════════════════╝
"
install 'code --install-extension' ${vscode[@]}

# Install fonts
echo "
╔══════════════════════════════════════════════╗
║   Installing Fonts ℬ                         ║
╚══════════════════════════════════════════════╝
"
brew tap caskroom/fonts
install 'brew cask install' ${fonts[@]}

echo "
╔══════════════════════════════════════════════╗
║   Packages Installed 💪🏻                      ║
╚══════════════════════════════════════════════╝
"

echo "
╔══════════════════════════════════════════════╗
║   Setting up workspace 🖥️                     ║
╚══════════════════════════════════════════════╝
"

# Show hidden files
echo "
╔══════════════════════════════════════════════╗
║   Showing Hidden Files 👀                    ║
╚══════════════════════════════════════════════╝
"
defaults write com.apple.finder AppleShowAllFiles YES

# Toggle dark theme
echo "
╔══════════════════════════════════════════════╗
║   Setting Dark Theme 🌙                      ║
╚══════════════════════════════════════════════╝
"
npm i -g dark-mode-cli
dark-mode on
npm rm -g dark-mode-cli

# Download iTerm assets
echo "
╔══════════════════════════════════════════════╗
║   Downloading iTerm Assets 🌈                ║
╚══════════════════════════════════════════════╝
"
wget https://github.com/NuroDev/dots/blob/master/iterm/colors.itermcolors -i ~/Desktop/colors.itermcolors
wget https://github.com/NuroDev/dots/blob/master/iterm/profile.json -i ~/Desktop/profile.json
wget https://github.com/NuroDev/dots/blob/master/iterm/icon.icns?raw=true -i ~/Desktop/iTerm-icon.icns

echo "
╔══════════════════════════════════════════════╗
║   Cleaning up 🗑                              ║
╚══════════════════════════════════════════════╝
"
brew cleanup
brew cask cleanup
npm prune -g

# --- Done ---
echo "
╔══════════════════════════════════════════════╗
║   Done ✨                                    ║
╚══════════════════════════════════════════════╝
"
