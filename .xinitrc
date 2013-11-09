#!/bin/sh
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

export MONITOR=`cat ~/.folwar/monitor`

xset +fp /usr/share/fonts/local

xrdb .Xresources
export TERM=rxvt-unicode

dropboxd &

~/.config/awesome/theme/set-wallpaper.sh
xscreensaver -no-splash &

setxkbmap -layout "ucw, cz" -rules evdev -option "grp:alt_shift_toggle,lv3:caps"

exec awesome
