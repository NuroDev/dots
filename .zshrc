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

# NVM (Node.js)
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Oh my ZSH
source $ZSH/oh-my-zsh.sh
