export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions zsh-interactive-cd zsh-navigation-tools)

source $ZSH/oh-my-zsh.sh

alias yay='yay --builddir=/tmp --cleanafter'
alias upd='yay -Syyu --builddir=/tmp --cleanafter'
alias updp='sudo pacman -Syyu'
alias cln='sudo yay -Scc && sudo pacman -Rns $(sudo pacman -Qtdq)'
alias clnp='sudo pacman -Rns $(sudo pacman -Qtdq)'
alias clock='tty-clock -c -C 7 -D'
alias q='exit'
alias s='sync'
alias ls="eza --tree --level=1 --icons=always --no-time --no-user --no-permissions"
alias pyvenv="python3 -m venv venv"
alias actvenv="source venv/bin/activate"
alias artnas="ssh art@192.168.1.20"
alias dcln="docker rm -v -f $(docker ps -qa) && docker system prune -a"