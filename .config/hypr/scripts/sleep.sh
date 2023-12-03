#! /bin/bash


swayidle -w \
    timeout 300 'hyprctl dispatch dpms off' \
    timeout 590 'gtklock' \
    timeout 600 'hyprctl dispatch dpms off' \
    after-resume 'hyprctl dispatch dpms on'

