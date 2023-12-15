#! /bin/bash

# This script is used to set the wallpaper on my desktop.

if [ -z "$XDG_WALLPAPER_DIR" ]; then
    XDG_WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
fi

if [ -z "$SWWW_CUBIC_BEZIER" ]; then
    SWWW_CUBIC_BEZIER="0.63,0.11,0.41,0.69"
fi


# get all files in XDG_WALLPAPER_DIR including subfolders
files=("$XDG_WALLPAPER_DIR"/**/*)

randfile=$(printf "%s\n" "${files[RANDOM % ${#files[@]}]}")
cursorpos=$(hyprctl cursorpos)
## fix cursor y offset from hyprctl
# height - y???
cursorpos=$(echo $cursorpos | awk '{print $1, $2-50}')
cursorx=$(echo $cursorpos | awk '{print $1}')
cursory=$(echo $cursorpos | awk '{print $2}')

#get display resolution
monitor_h=$(hyprctl monitors -j | jq '.[0].height'  )

cursory=$(echo $cursory | awk -v monitor_h="$monitor_h" '{print monitor_h-$1-50}')

swww img $randfile --transition-angle=30 --transition-duration=1.5 --transition-fps=144 --transition-bezier="$SWWW_CUBIC_BEZIER" --transition-type=outer --transition-pos="$cursorx $cursory" --resize=crop
