#! /bin/bash

## 
# Autostarts all scripts in ~/.config/autostart

files=$(/bin/ls -1 $HOME/.config/autostart)

for file in $files; do
	script=$(/bin/cat $HOME/.config/autostart/$file | /bin/grep Exec | /usr/bin/cut -d '=' -f 2)
	exec $script & disown
done
