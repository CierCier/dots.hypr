
if [ -d /ust/share/doc/find-the-command ]
then
    source /usr/share/doc/find-the-command/ftc.zsh
fi


export EDITOR=nvim

# Aliases
alias neofetch="/usr/bin/fastfetch"
alias ls="/usr/bin/exa --long --all --colour auto --git --group-directories-first"
alias cat="/usr/bin/bat --style header --style snip --style changes --style header"
alias grep="/usr/bin/rg"


## clang set
#C_OPTS="-O3 -march=native -mtune=native -pipe -std=c17"
#CXX_OPTS="$C_OPTS -std=c++2a"
#export CFLAGS="$C_OPTS"
#export CXXFLAGS="$CXX_OPTS"
#export LDFLAGS="-Wl,-O3,--sort-common,--as-needed,-z,relro,-z,now, -fuse-ld=lld"
#export CC=clang
#export CXX=clang++

#alias cc="clang $CFLAGS"
#alias cxx="clang++ $CXXFLAGS"

alias vim="nvim"
alias vi="nvim"


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
    PATH+=:$HOME/.local/bin
fi

# adding cargo bin to path if exists
if [ -d $HOME/.cargo/bin ]
then
    PATH+=:$HOME/.cargo/bin
fi

# adding flutter bin to path if exists
if [ -d /opt/flutter ]
then
    PATH+=:/opt/flutter/bin
fi


if [ -d $HOME/.ghcup ]
then
    PATH+=:$HOME/.ghcup/bin         
fi

if [ -d $HOME/.bun/bin ]
then
    PATH+=:$HOME/.bun/bin/
fi

if [ -d $HOME/.encore/bin ]
then
    PATH+=:$HOME/.encore/bin/
fi


export PATH=$PATH


## terminal colors
## Not recommended
## Ruins standard 16 colors in most cases
#if [ -d $HOME/.cache/wal ]
#then
#    (/usr/bin/cat $HOME/.cache/wal/sequences &)
#fi


# mcfly

if [ -f $(which mcfly) ] 
then
    export MCFLY_KEY_SCHEME=vim
    export MCFLY_FUZZY=2
    eval "$(mcfly init zsh)"
fi

