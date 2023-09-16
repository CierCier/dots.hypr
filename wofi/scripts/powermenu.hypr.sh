#!/bin/bash

entries="⏻ shutdown \n⭮ reboot \n⇠ logout \n⍉ hibernate "

selected=$(echo -e $entries | wofi  --conf=$HOME/.config/wofi/config.powermenu --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

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
