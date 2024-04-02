# TODO: refactor this file
# bash
alias     ..='pushd .. > /dev/null'
alias    ...='pushd ../../ > /dev/null'
alias   ....='pushd ../../../ > /dev/null'
alias  .....='pushd ../../../../ > /dev/null'
alias ......='pushd ../../../../../ > /dev/null'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -AlFh'
alias la='ls -A'
alias l='ls -CF'

alias ebrc='vim ~/.bashrc'
alias sbrc='echo "Sourcing ~/.bashrc" && source ~/.bashrc'
alias evrc='vim ~/.vimrc'
alias ebal='vim ~/.bash_aliases'
alias ebis='vim ~/repos/DotFiles/install_softwares.sh'

alias apti='sudo apt install'
alias apts='apt-cache search'
alias aptp='apt-cache policy'
alias aptu='sudo apt update && sudo apt upgrade'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Useful tools
alias bat='batcat --style=plain'

# Python
alias py='python3'
alias ipy='ipython3'
## virtualenv
alias  senv='source venv/bin/activate'
alias  cenv='! [ -d ./venv/ ] && python3 -m virtualenv venv'
alias csenv='cenv && senv && [ -f ./requirements.txt ] && pip install -r requirements.txt'
## Jupyter
alias clean_checkpoints='rm -rf `find -type d -name .ipynb_checkpoints`'
nbd() {
    nbdime diff "$1" "$2" | bat --style="plain"
}

## pylint
alias pylintrc='! [ -f ./.pylintrc ] && [ -x "$(command -v pylint)" ] &&  pylint --generate-rcfile > ./.pylintrc'
alias  pylintc='[ -x "$(command -v pylint)" ] && pylint --output-format=colorized'

## pip
alias pipreq='pip freeze > requirements.txt'

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
# alias glgap='git log --decorate --graph --all --pretty=oneline --abbrev-commit'
alias glgap='git log --graph --abbrev-commit --decorate --all --pretty=format:"%C(auto)%h%C(reset) -%C(auto)%d%C(reset) %s %C(magenta)(%cr)%C(reset) %C(blue)<%an>%C(reset)"'

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
alias   dco='docker-compose'
