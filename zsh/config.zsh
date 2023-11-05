source /usr/share/doc/find-the-command/ftc.zsh

# Aliases
alias neofetch="/usr/bin/fastfetch"
alias ls="/usr/bin/exa --long --all --colour auto --git --group-directories-first"
alias cat="/usr/bin/bat --style header --style snip --style changes --style header"


# wallpaper doohickery
wall() {
    if (( $# == 0 ))
    then
        echo "wall <file>\n<file> can be most image formats and gifs\nUses swww -> ensure that you run 'swww init' before this"
        return 1
    fi
    swww img $@ --transition-angle=30 --transition-duration=2.1 --transition-fps=60 --transition-bezier=.63,.11,.41,.69 --transition-type=outer --transition-pos=1400,1080 --resize=crop
}


# Path Manipulation
if [ -d $HOME/.local/bin ]
then
    PATH=$PATH:$HOME/.local/bin
fi

# adding cargo bin to path if exists
if [ -d $HOME/.cargo/bin ]
then
    PATH=$PATH:$HOME/.cargo/bin
fi

# adding flutter bin to path if exists
if [ -d /opt/flutter ]
then
    PATH=$PATH:/opt/flutter/bin
fi


if [ -d $HOME/.ghcup ]
then
    PATH=$PATH:$HOME/.ghcup/bin         
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
