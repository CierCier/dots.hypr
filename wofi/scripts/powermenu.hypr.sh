#!/bin/bash

entries="Shutdown Reboot Logout Hibernate"

selected=$(printf '%s\n' $entries | wofi --conf=$HOME/.config/wofi/config.powermenu --style=$HOME/.config/wofi/style.widgets.css  | awk '{print tolower($1)}')

case $selected in
  shutdown)
    exec systemctl -i poweroff;;
  logout)
    exec hyprctl dispatch exit;;
  reboot)
    exec systemctl reboot;;
  hybernate)
      exec systemctl hibernate;;
esac
