#! /bin/bash
#
entries="Shutdown Reboot Logout Hibernate"
selected=$(printf '%s\n' $entries | fuzzel -d -l3 | awk '{print tolower($1)}')

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

