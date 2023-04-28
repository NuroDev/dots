# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Initialize starship prompt
eval "$(starship init zsh)"

# Set shell theme
ZSH_THEME="spaceship"

# Config
HIST_STAMPS="dd/mm/yyyy"
autoload -U compinit && compinit

# Default editor
export EDITOR="code"

# Plugins
plugins=(
    brew
    copyfile
    copypath
    docker
    docker-compose
    emoji
    extract
    fnm
    git
    gitignore
    iterm2
    last-working-dir
    macos
    npm
    rust
    transfer
    vscode
    web-search
    yarn
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)

# Cargo
source $HOME/.cargo/env

# FNM (Fast Node Manager)
eval "$(fnm env)"

# Oh my ZSH
source $ZSH/oh-my-zsh.sh

# Functions
source ~/.functions

# Aliases
source ~/.aliases

# fet.sh
~/.fet

# pnpm
export PNPM_HOME="/Users/nuro/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
# bun completions
[ -s "/Users/nuro/.bun/_bun" ] && source "/Users/nuro/.bun/_bun"
