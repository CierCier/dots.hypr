#! /bin/bash

#kill waybar if running
if [ ! -z "$(pidof waybar)" ]; then
    killall waybar
fi

waybar -c $HOME/.config/hypr/waybar/config.jsonc -s $HOME/.config/hypr/waybar/style.scss & disown
