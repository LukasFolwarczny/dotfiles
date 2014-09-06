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
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ',,'='cd "$OLDPWD"'
alias velikost='du -hd 1'
alias keyboard-cz='setxkbmap -layout "cz, us" -option "grp:alt_shift_toggle"'
alias keyboard-ucw='setxkbmap -model pc104 -layout us,cz -variant ,ucw -option grp:caps_switch'

alias mp='mupdf -r 142'

alias gA='git add'
alias gB='git branch'
alias gC='git commit'
alias gCh='git checkout'
alias gD='git diff'
alias gL='git log'
alias gP='git pull'
alias gPs='git push'
alias gS='git status'

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

# Configuration specific for a single machine
[ -f ~/.bashrc_local ] && source ~/.bashrc_local

# Completion

function tmpsync() {
	tmpls > ~/.folwar/tmpfiles
}
export -f tmpsync

if [ -f ~/.folwar/tmpfiles ]; then
	IFS=' ' complete -F _tmp_complete tmprm
	function _tmp_complete() {
		local cur=${COMP_WORDS[COMP_CWORD]}
		COMPREPLY=( $(compgen -W "`cat ~/.folwar/tmpfiles`" -- $cur ))
	}
fi
