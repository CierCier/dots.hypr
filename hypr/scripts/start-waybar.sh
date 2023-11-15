#! /bin/bash

killall waybar
waybar -c $HOME/.config/hypr/waybar/config.jsonc -s $HOME/.config/hypr/waybar/style.css 
