#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

#[[ `tty` = "/dev/tty1" ]] && kolejnet &
[[ `tty` = "/dev/tty1" ]] && startx

unicode_start
setfont Lat2-Terminus16
