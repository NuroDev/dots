#!/bin/bash

export vscode=(
  # Better .toml support
  bungcip.better-toml
  # Bracket pair colorizer
  coenraads.bracket-pair-colorizer
  # C++ tools
  ms-vscode.cpptools
  # C# tools
  ms-vscode.csharp
  # Discord integration
  icrawl.discord-vscode
  # Docker integration
  peterjausovec.vscode-docker
  # Import cost
  wix.vscode-import-cost
  # NPM integration
  eg2.vscode-npm-script
  # NPM Intellisense
  christian-kohler.npm-intellisense
  # One Dark Pro theme
  zhuangtongfa.Material-theme
  # Remote SSH
  ms-vscode-remote.remote-ssh
  # Rust lang support
  matklad.rust-analyzer
  # SVG viewer
  cssho.vscode-svgviewer
  # VueJS support
  octref.vetur
  # Spotify integration
  shyykoserhiy.vscode-spotify
)

echo "
╔══════════════════════════════════════════════╗
║   Installing VS Code Extensions ⌨️            ║
╚══════════════════════════════════════════════╝
"
install 'code --install-extension' ${vscode[@]}
