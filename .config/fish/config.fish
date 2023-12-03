## Set values
# Hide welcome message
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

## Export variable need for qt-theme
if type "qtile" >> /dev/null 2>&1
   set -x QT_QPA_PLATFORMTHEME "qt5ct"
end

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low


## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
  source ~/.fish_profile
end

# Add ~/.local/bin to PATH
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

# Add depot_tools to PATH
if test -d ~/Applications/depot_tools
    if not contains -- ~/Applications/depot_tools $PATH
        set -p PATH ~/Applications/depot_tools
    end
end


## Advanced command-not-found hook
source /usr/share/doc/find-the-command/ftc.fish

## Aliases
alias neofetch /usr/bin/fastfetch
alias ls "/usr/bin/eza --long --all --colour auto --git --group-directories-first"

## Functions
# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Fish command history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end


# Replace some more things with better alternatives
alias cat='bat --style header --style snip --style changes --style header'

## Run fastfetch if session is interactive
#if status --is-interactive && type -q fastfetch
#   fastfetch --load-config neofetch
#end

function wall --argument filepath
    wal -i $filepath -n
    swww img $(/usr/bin/cat $HOME/.cache/wal/wal) --transition-angle 30 --transition-duration 2 --transition-type wave
end



## cpu fetch
if status --is-interactive
	#cpufetch | lolcat
	#neofetch | lolcat
end

set -xg PATH $PATH $HOME/.cargo/bin $HOME/.local/bin 

