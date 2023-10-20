source /usr/share/doc/find-the-command/ftc.zsh

# Aliases
alias neofetch="/usr/bin/fastfetch"
alias ls="/usr/bin/exa --long --all --colour auto --git --group-directories-first"
alias cat="/usr/bin/bat --style header --style snip --style changes --style header"


# wallpaper doohickery
wall() {
    if (( $# == 0 ))
    then
        echo "wall <file>"
        return 1
    fi
    wal -i "$@" --cols16 -n
    swww img "$(< "${HOME}/.cache/wal/wal")" --transition-angle=30 --transition-type=wipe --resize=crop
}


# Path Manipulation
if [ -d $HOME/.local/bin ]
then
    export PATH=$PATH:$HOME/.local/bin
fi

# adding cargo bin to path if exists
if [ -d $HOME/.cargo/bin ]
then
    export PATH=$PATH:$HOME/.cargo/bin
fi

# adding flutter bin to path if exists
if [ -d /opt/flutter ]
then
    export PATH=$PATH:/opt/flutter/bin
fi

export PATH=$PATH




#terminal colors
# Not recommended
# ruins standard 16 colors in most cases
#if [ -d $HOME/.cache/wal ]
#then
#    (/usr/bin/cat $HOME/.cache/wal/sequences &)
#fi


# mcfly

if [ -f $(which mcfly) ] 
then
    eval "$(mcfly init zsh)"
fi



# init p10k
if [ -f $HOME/.p10k.zsh  ]
then
    source $HOME/.p10k.zsh
fi
