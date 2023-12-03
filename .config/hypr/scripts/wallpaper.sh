#! /bin/bash

files=($HOME/Pictures/Wallpapers/*/*)

randfile=$(printf "%s\n" "${files[RANDOM % ${#files[@]}]}")

swww img $randfile --transition-angle=30 --transition-duration=2.1 --transition-fps=60 --transition-bezier=.63,.11,.41,.69 --transition-type=outer --transition-pos=1400,1080 --resize=crop
