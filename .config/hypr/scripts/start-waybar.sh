#! /bin/bash

#check for pywal cache
if [ ! -d $HOME/.cache/wal ]; then
    if [ -z "$(pidof swww-daemon)"]; then
        swww init
    fi
    image=$(swww query | grep -oP '(?<=image: ).*')
    wal --backend haishoku --cols16 -s -n -q -i "$image"
fi


#kill waybar if running
if [ ! -z "$(pidof waybar)" ]; then
    killall waybar
fi

waybar -c $HOME/.config/hypr/waybar/config.jsonc -s $HOME/.config/hypr/waybar/style.css & disown
