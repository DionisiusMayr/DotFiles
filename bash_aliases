# bash
alias ebrc="vim ~/.bashrc"
alias sbrc='echo "Sourcing ~/.bashrc" && source ~/.bashrc'
alias evrc="vim ~/.vimrc"

alias apti='sudo apt install'
alias apts='sudo apt-cache search'
alias aptu='sudo apt update && sudo apt upgrade'

# git
alias gs='git status'

alias ga='git add'
alias gd='git diff'
alias gb='git branch -a'

alias gc='git commit'
alias gcm='git commit -m'
alias gch='git checkout'
alias gcmh='git checkout master'

alias gl='git log --decorate'
alias glg='git log --decorate --graph'
alias glgs='git log --decorate --graph --stat'
alias gla='git log --decorate --all'
alias glas='git log --decorate --all --stat'
alias glga='git log --decorate --graph --all'
alias glgas='git log --decorate --graph --all --stat'
alias glgap='git log --decorate --graph --all --pretty=oneline --abbrev-commit'

# tmux
alias stc='echo "Sourcing ~/.tmux.conf" && tmux source-file ~/.tmux.conf'

# hledger
alias hl='hledger'
alias hla='hledger add'
alias hlb='hledger balance'
alias hlr='hledger register'
