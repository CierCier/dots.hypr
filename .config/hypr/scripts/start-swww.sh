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
image=$(swww query | grep -oP '(?<=image: ).*')
if [ -z "$image" ]; then
    #no image in cache, set random from defaults
    ~/.local/bin/wallpaper
fi
image=$(swww query | grep -oP '(?<=image: ).*')

# building pywal cache
#
# important step
# waybar would killitself without it......

wal --backend haishoku --cols16 -s -n -q -i "$image"
