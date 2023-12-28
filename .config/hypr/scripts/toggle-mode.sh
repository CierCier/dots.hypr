#! /bin/bash


HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==2{print $2}')
if [ "$HYPRGAMEMODE" = 1 ] ; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:drop_shadow 0;\
        keyword decoration:blur:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 2;\
        keyword decoration:rounding 0"

    
    brightness="$(brightnessctl get)"
    if [ "$brightness" -lt 1 ]; then
        brightness=1
    elif [ "$brightness" -gt 60 ]; then
        brightness=60
    fi
    brightnessctl set "$brightness"
    notify-send "Enabled Game Mode" -t 3000 -u low -a "Game Mode" -i "state_running"
    exit
fi

hyprctl reload
notify-send "Disabled Game Mode" -t 3000 -u low -a "Game Mode" -i "state_paused"
