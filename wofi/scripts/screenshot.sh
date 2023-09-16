#!/bin/bash

entries="Area ColorPicker Window Screen"

selected=$(printf '%s\n' $entries | wofi --style=$HOME/.config/wofi/style.widgets.css --conf=$HOME/.config/wofi/config.screenshot | awk '{print tolower($1)}')

case $selected in
  screen)
      $HOME/.config/grimshot/auto-copy.sh screen;;
  area)
     $HOME/.config/grimshot/auto-copy.sh area;;
  window)
     $HOME/.config/grimshot/auto-copy.sh window;;
  colorpicker)
    /usr/bin/hyprpicker --no-fancy --autocopy --format=hex;;
esac
