# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set Shell Theme
ZSH_THEME="spaceship"

# Config
HIST_STAMPS="dd/mm/yyyy"
autoload -U compinit && compinit

# SSH Path
export SSH_KEY_PATH="~/.ssh/rsa_id"

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

source $ZSH/oh-my-zsh.sh

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship