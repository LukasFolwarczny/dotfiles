#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=vim
export PATH=~/bin:$PATH
export HISTCONTROL=ignoreboth
export HISTSIZE=10000 HISTFILESIZE=10000

# I still have not decided whether this command is useful
set -o vi 

PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias l='ls --color=auto'
alias la='ls -a --color=auto'
alias ll='ls -hl --color=auto'
alias lal='ls -hal --color=auto'
alias e='exit'
alias wifi='sudo wifi-menu wlp4s0'
alias ..='cd ..'
alias ',,'='cd "$OLDPWD"'
alias velikost='du -hd 1'

# History completion
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
