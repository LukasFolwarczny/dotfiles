#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=vim
export PATH=~/bin:$PATH
export HISTCONTROL=ignoreboth
export HISTSIZE=10000 HISTFILESIZE=10000

set -o vi 

PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias l='ls --color=auto'
alias la='ls -A --color=auto'
alias ll='ls -hl --color=auto'
alias lal='ls -hAl --color=auto'
alias e='exit'
alias wifi='sudo wifi-menu wlp4s0'
alias ..='cd ..'
alias ',,'='cd "$OLDPWD"'
alias velikost='du -hd 1'
alias keyboard-cz='setxkbmap -layout "cz, us" -option "grp:alt_shift_toggle"'
alias keyboard-ucw='setxkbmap -layout "ucw, cz" -rules evdev -option \
"grp:alt_shift_toggle,lv3:caps"'


# History completion
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

alias poznamky='vim ~/notes/NOTES'
alias ukoly='cat ~/notes/TODO'
function zaukoluj() {
    echo "$@" >> ~/notes/TODO
}

function man() {
    if [ "$1" = forst ]; then
        echo yes;
    else
	/usr/bin/man "$@";
    fi 
}
