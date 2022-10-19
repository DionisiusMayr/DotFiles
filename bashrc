# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=50000
HISTFILESIZE=100000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_secret ]; then
    . ~/.bash_secret
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# setxkbmap -option ctrl:nocaps       # Make Caps Lock a Control key
# setxkbmap -option caps:ctrl       # Make Caps Lock a Control key

########
# PATH #
########

# .local/bin
if [ -d "${HOME}/.local/bin" ]; then
    export PATH="${HOME}/.local/bin/:${PATH}"
fi

# R
if [ -d "/usr/lib/R/bin" ]; then
   export PATH="${PATH}:/usr/lib/R/bin"
fi

# Emacs
if [ -d "${HOME}/.emacs.d/bin" ]; then
   export PATH="${PATH}:${HOME}/.emacs.d/bin"
fi

# Haskell Cabal
if [ -d "${HOME}/.cabal/bin" ]; then
    export PATH="${HOME}/.cabal/bin:${PATH}"
fi

############
# PATH END #
############

stty -ixon

# hledger support
export LEDGER_FILE="${HOME}/hledger.journal"

# Vim support
export EDITOR='vim'

# See vim :h syntastic-checkers for pylint
export LC_CTYPE=en_CA.UTF-8

# Git completion
source "${HOME}/repos/DotFiles/git-completion.bash"
source "${HOME}/repos/DotFiles/git-prompt.sh"

if [ -f "${HOME}/repos/bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source "${HOME}/repos/bash-git-prompt/gitprompt.sh"
fi

export GIT_PROMPT_THEME="Single_line_Solarized_Lamda"

# tmux support
[ -z "$TMUX" ] && export TERM=xterm-256color

# TODO: fix this: bat as man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[[ -s "${HOME}/.autojump/etc/profile.d/autojump.sh" ]] && source "${HOME}/.autojump/etc/profile.d/autojump.sh"

# Haskell configs
[ -f "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env" ] && source "${GHCUP_INSTALL_BASE_PREFIX:=$HOME}/.ghcup/env"

# Open tmux by default:
# ref: https://askubuntu.com/questions/1057471/how-to-automatically-start-tmux-when-opening-gnome-terminal
# If not running interactively, do not do anything
[[ $- != *i* ]] && return
# Otherwise start tmux
[[ -z "${TMUX}" ]] && exec tmux

# diff-so-fancy in ${PATH}
export PATH=${PATH}:~/installed_software/diff-so-fancy

# For the Cuda libraries
# TODO: Check if LD_LIBRARY_PATH is indeed empty
export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/

alias python=python3
