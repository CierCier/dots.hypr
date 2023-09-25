#!/bin/bash

entries="Area ColorPicker Window Screen"

selected=$(printf '%s\n' $entries | wofi --style=$HOME/.config/wofi/style.widgets.css --conf=$HOME/.config/wofi/config.screenshot | awk '{print tolower($1)}')

case $selected in
  screen)
      $HOME/.config/hypr/scripts/screenshot  screen;;
  area)
     $HOME/.config/hypr/scripts/screenshot area;;
  window)
     $HOME/.config/hypr/scripts/screenshot window;;
  colorpicker)
    /usr/bin/hyprpicker --no-fancy --autocopy --format=hex;;
esac
