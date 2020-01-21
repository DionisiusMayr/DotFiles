# bash
alias     ..='pushd .. > /dev/null'
alias    ...='pushd ../../ > /dev/null'
alias   ....='pushd ../../../ > /dev/null'
alias  .....='pushd ../../../../ > /dev/null'
alias ......='pushd ../../../../../ > /dev/null'

alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'

# Python
## virtualenv
alias  senv='source venv/bin/activate'
alias  cenv='! [ -d ./venv/ ] && python3 -m virtualenv venv'
alias csenv='cenv && senv && [ -f ./requirements.txt ] && pip install -r requirements.txt'

## pylint
alias pylintrc='! [ -f ./.pylintrc ] && pylint --generate-rcfile > ./.pylintrc'

## pip
alias pipreq='pip freeze > requirements.txt'

alias ebrc='vim ~/.bashrc'
alias sbrc='echo "Sourcing ~/.bashrc" && source ~/.bashrc'
alias evrc='vim ~/.vimrc'

alias apti='sudo apt install'
alias apts='sudo apt-cache search'
alias aptu='sudo apt update && sudo apt upgrade'

# git
alias gs='git status'

alias ga='git add'
alias gd='git diff'
alias gb='git branch'

alias   gc='git commit'
alias  gcm='git commit -m'
alias  gch='git checkout'
alias gcmh='git checkout master'

alias    gl='git log --decorate'
alias   glg='git log --decorate --graph'
alias  glgs='git log --decorate --graph --stat'
alias   gla='git log --decorate --all'
alias  glas='git log --decorate --all --stat'
alias  glga='git log --decorate --graph --all'
alias glgas='git log --decorate --graph --all --stat'
alias glgap='git log --decorate --graph --all --pretty=oneline --abbrev-commit'

# tmux
alias stc='echo "Sourcing ~/.tmux.conf" && tmux source-file ~/.tmux.conf'

# hledger
alias  hl='hledger'
alias hla='hledger add'
alias hlb='hledger balance'
alias hlr='hledger register'

# Docker
alias  dils='docker image ls'
alias dstop='docker stop $(docker ps -q)'
alias drmcontainers='docker rm -f $(docker ps -a -q)'
alias   dst='read -p "Stop all containers and remove them? " -n 1 -r && [[ $REPLY =~ ^[Yy]$ ]] && docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
alias   dps='docker ps -a  --format "table {{.Status}}\t{{.Names}}\t{{.Ports}}\t{{.Image}}\t{{.Command}}"'
alias  drmi='docker rmi $(docker images --quiet --filter "dangling=true")'
alias  drmv='docker volume rm $(docker volume ls -qf dangling=true)'

# Mac OS X
alias cmac="find . -name '*.DS_Store' -type f -delete"
