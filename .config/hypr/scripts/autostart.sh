#! /bin/bash

## 
# Autostarts all scripts in ~/.config/autostart

files=$(/bin/ls -1 $HOME/.config/autostart)

for file in $files; do
	dex $HOME/.config/autostart/$file & disown
done

dex -ad
