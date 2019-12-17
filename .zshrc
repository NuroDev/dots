# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Initialize starship prompt
eval "$(starship init zsh)"

# Set Shell Theme
ZSH_THEME="spaceship"

# Config
HIST_STAMPS="dd/mm/yyyy"
autoload -U compinit && compinit

# SSH Path
export SSH_KEY_PATH="~/.ssh/rsa_id"

# LibFFI fix
export PKG_CONFIG_PATH='/usr/local/opt/libffi/lib/pkgconfig'

# Plugins
plugins=(
    brew 
    copyfile 
    docker 
    docker-compose 
    extract 
    git 
    last-working-dir 
    npm 
    osx 
    rust 
    vscode 
    web-search 
    yarn 
    zsh-autosuggestions 
    zsh-completions 
    zsh-syntax-highlighting
)

# Alias'
alias clock='tock -c -s -C 15'
alias dkps="docker ps"
alias dkst="docker stats"
alias dkpsa="docker ps -a"
alias dkimgs="docker images"
alias minify='tr -d "\n\r"'
alias mkv-to-mp4='for f in *.mkv; do ffmpeg -i "$f" -c copy "${f%.mkv}.mp4"; done'
alias neolol='clear && neofetch | lolcat'
alias send='ffsend'
alias prune_ds_store='find . -name ".DS_Store" -depth -exec rm {} \;'
alias alpine='docker run --name alpine -it alpine /bin/sh && docker stop alpine && docker rm alpine'
alias ubuntu='docker run --name ubuntu -it ubuntu /bin/bash && docker stop ubuntu && docker rm ubuntu'

source $ZSH/oh-my-zsh.sh
