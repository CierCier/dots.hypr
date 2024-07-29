#! /bin/bash

#check for pywal cache
if [ ! -d $HOME/.cache/wal ]; then
    if [ -z "$(pidof swww-daemon)"]; then
        swww init
    fi
    image=$(swww query | grep -oP '(?<=image: ).*')
    wal --backend haishoku --cols16 -s -n -q -i "$image"
fi


if [ ! -z "$1" ]; then
	bar=$1
else
	if [ -f /usr/bin/waybar ]; then
		bar="waybar"
	else
		bar="ags"
	fi
fi


killall waybar
ags --quit


if [ $bar = "waybar"  ]; then
	waybar -c $HOME/.config/hypr/waybar/config.jsonc -s $HOME/.config/hypr/waybar/style.css & disown
fi

if [ $bar = "ags" ]; then
	ags -c $HOME/.config/hypr/ags/config.js & disown
fi

