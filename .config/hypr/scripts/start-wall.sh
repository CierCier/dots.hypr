#! /bin/bash

#check for WALLPAPER_DIR

if [ -z "$WALLPAPER_DIR" ]; then
    #using default hyprland wallpaper directory
    export WALLPAPER_DIR="/usr/share/hyprland/"
fi

if [ -z "$(pidof swww-daemon)" ]; then
	swww-daemon -q & disown
fi



~/.local/bin/wallpaper --restore
