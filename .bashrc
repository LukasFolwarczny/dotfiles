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

alias gP='git pull'
alias gPs='git push'
alias gC='git commit'
alias gCh='git checkout'
alias gS='git status'
alias gD='git diff'
alias gA='git add'
alias gL='git log'


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

function setmonitor() {

	if [ -z "$1" ]; then
		echo "Available monitor options: FULLHD, NTB, NTB+FULLHD, CUSTOM"
		return 0
	fi

	MONITOR="$1"
	echo "$MONITOR" > ~/.folwar/monitor

	if [ "$MONITOR" != CUSTOM ]; then

		OPTION='"metamodes" "VGA-0: NULL, LVDS-0: nvidia-auto-select +0+0"'

		if [ "$MONITOR" = "FULLHD+NTB" ]; then
			MONITOR="NTB+FULLHD"
		fi
		if [ "$MONITOR" = FULLHD ]; then
			OPTION='"metamodes" "VGA-0: nvidia-auto-select +0+0, LVDS-0: NULL"'
		fi
		if [ "$MONITOR" = "NTB+FULLHD" ]; then
			OPTION='"metamodes" "VGA-0: nvidia-auto-select +0+0, LVDS-0: nvidia-auto-select +0+0"'
		fi

		sudo ed /etc/X11/xorg.conf << EOF
,s/^    Option.*"metamodes".*$/    Option         $OPTION/g
,w
EOF

	fi
}

# Configuration specific for a single machine
[ -f ~/.bashrc_local ] && source ~/.bashrc_local
