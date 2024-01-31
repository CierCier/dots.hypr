#! /bin/bash

#check for WALLPAPER_DIR

if [ -z "$WALLPAPER_DIR" ]; then
    #using default hyprland wallpaper directory
    export WALLPAPER_DIR="/usr/share/hyprland/"
fi

if [ -z "$(pidof swww-daemon)" ]; then
	swww init
fi


#check for image cache
image=$(swww query | /usr/bin/grep -oP '(?<=image: ).*')

~/.local/bin/wallpaper.sh $image
