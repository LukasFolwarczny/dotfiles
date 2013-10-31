#!/bin/sh
if [ "$MONITOR" = CUSTOM ]; then
	exit 0
fi

WDIR=~/.config/awesome/theme/yk/

if [ "$MONITOR" = FULLHD  -o "$MONITOR" = "NTB+FULLHD" ]; then
    WDIR=~/.config/awesome/theme/ykhd/
fi

cp $WDIR/`ls $WDIR | sort -R | head -n 1` \
~/.config/awesome/theme/wallpaper.jpg
