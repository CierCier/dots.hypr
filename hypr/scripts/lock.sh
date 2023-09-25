#! /bin/bash


swayidle \
    timeout 5 'hyprctl dispatch dpms off'\
    after-resume 'hyprctl dispatch dpms on' &

swaylock
kill %%
