#! /bin/bash
#
#
## !!!Depricated!!!
# use wlogout instead


entries="Shutdown Reboot Logout Hibernate"
selected=$(printf '%s\n' $entries | fuzzel -d -l4 | awk '{print tolower($1)}')

case $selected in 
    shutdown)
        exec systemctl -i poweroff;;
    logout)
        exec hyprctl dispatch exit;;
    reboot)
        exec systemctl reboot;;
    hibernate)
        exec systemctl hibernate;;
esac

