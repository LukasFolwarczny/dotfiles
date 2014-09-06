#!/bin/bash
# Copies the dot files to a given directory.
# With -f option overrides existing files.
# Usage: setup.sh [-f] target_directory
FORCE=0
if [ "$1" = "-f" ]; then
	FORCE=1
	shift
fi

TARGET="$1"
if [ -z $TARGET ]; then
	echo "Usage: $0 [-f] target_directory"
	exit 1
fi

DIRS=(bin .folwar .config .config/luakit .config/awesome .config/awesome/theme .moc .moc/themes)

FILES=(.bash_profile .bashrc .vimrc .xinitrc .Xresources)
FILES+=(bin/awesome-fetch-wallpapers bin/awesome-set-wallpaper bin/trymocp bin/yegor-korzh-downloader)
AS=.config/awesome
FILES+=($AS/rc.lua $AS/volume.lua $AS/theme/theme.lua)
LK=.config/luakit
FILES+=($LK/rc.lua $LK/adblock_chrome.lua $LK/adblock.lua $LK/binds.lua $LK/globals.lua $LK/modes.lua $LK/theme.lua $LK/webview.lua $LK/window.lua)
FILES+=(.moc/config .moc/themes/blackwhite)

for di in ${DIRS[@]}; do
	DI="$TARGET/$di"
	if [ ! -d "$DI" ]; then
		mkdir "$DI"
	fi
done

for file in ${FILES[@]}; do
	FILE="$TARGET/$file"
	if [ -f "$FILE" -a "$FORCE" = 0 ]; then
		echo "File $FILE already exists. Use '$0 -f' to override."
	else
		cp "$file" "$FILE"
	fi
done
