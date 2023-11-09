#! /bin/bash


swayidle -w \
    timeout 300 'hyprctl dispatch dpms off' \
    timeout 600 'gtklock -d' \
    after-resume 'hyprctl dispatch dpms on'

