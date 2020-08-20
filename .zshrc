# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Initialize starship prompt
eval "$(starship init zsh)"

# Set shell theme
ZSH_THEME="spaceship"

# Config
HIST_STAMPS="dd/mm/yyyy"
autoload -U compinit && compinit

# SSH Path
export SSH_KEY_PATH="~/.ssh/rsa_id"

# LibFFI fix
export PKG_CONFIG_PATH='/usr/local/opt/libffi/lib/pkgconfig'

# Default editor
export EDITOR="code"

# Plugins
plugins=(
    brew
    cargo
    copydir
    copyfile
    docker
    docker-compose
    emoji
    extract
    git
    gitignore
    iterm2
    last-working-dir
    npm
    osx
    rust
    transfer
    vscode
    web-search
    yarn
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
)

# Functions
source ~/.functions

# Aliases
source ~/.aliases

# Oh my ZSH
source $ZSH/oh-my-zsh.sh

# Fet (Launch prompt)
~/.fet
