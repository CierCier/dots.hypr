#! /bin/bash


swayidle -w timeout 300 'hyprctl dispatch dpms off'\
    timeout 600 '~/.config/hypr/scripts/lock.sh'\
    resume 'hyprctl dispatch dpms on'

