#! /bin/bash
#

if [ $# -gt 0 ]
then
    selected=$1
else
    enteries="Area ColorPicker Screen"
    selected=$(printf '%s\n' $enteries | fuzzel -d -l3 -w14  --prompt=""  | awk '{print tolower($1)}')
fi
case $selected in
    screen)
        exec /usr/bin/grimblast --notify copysave screen;;
    area)
        exec /usr/bin/grimblast --notify copysave area;;
    colorpicker)
        exec /usr/bin/hyprpicker --no-fancy --autocopy --format=hex;;
esac
