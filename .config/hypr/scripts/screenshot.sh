#! /bin/bash
#

if [ $# -gt 0 ]
then
    selected=$1
else
    enteries="Area ColorPicker Screen"
    selected=$(printf '%s\n' $enteries | fuzzel -d -l3 -w14  --prompt=""  | awk '{print tolower($1)}')
fi



filename=$(date +%Y-%m-%d-%H-%M-%S.png)

screenshots_dir=~/Pictures/Screenshots


if [ ! -d $screenshots_dir ]
then
	mkdir -p $screenshots_dir --parents
fi

case $selected in
    screen)
        exec /usr/bin/grimblast --notify copysave screen $screenshots_dir/$filename ;;
    area)
        exec /usr/bin/grimblast --notify copysave area $screenshots_dir/$filename ;;
    colorpicker)
        exec /usr/bin/hyprpicker --no-fancy --autocopy --format=hex;;
esac
