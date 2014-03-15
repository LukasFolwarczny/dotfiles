#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

unicode_start
setfont Lat2-Terminus16

export BROWSER="chromium"

[ "`tty`" = "/dev/tty1" ] && ( (internet && sudo ntpd -q) & )
[ "`tty`" = "/dev/tty1" ] && startx
