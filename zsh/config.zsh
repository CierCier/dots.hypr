# plugin system
source $HOME/.config/zsh/antigen.zsh

antigen use oh-my-zsh

antigen bundle RobSis/zsh-completion-generator

antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein

antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme romkatv/powerlevel10k
antigen apply

source /usr/share/doc/find-the-command/ftc.zsh

# Aliases
alias neofetch="/usr/bin/fastfetch"
alias ls="/usr/bin/exa --long --all --colour auto --git --group-directories-first"
alias cat="bat --style header --style snip --style changes --style header"


# doohickery

wall() {
    if (( $# == 0 ))
    then
        echo "wall <file>"
        return 1
    fi


    wal -i "$@" --cols16 -n
    swww img "$(< "${HOME}/.cache/wal/wal")" --transition-angle 30 --transition-type wave
}



# Path Manipulation
if [ -d $HOME/.local/bin ]
then
    export PATH=$PATH:$HOME/.local/bin
fi

if [ -d $HOME/.cargo/bin ]
then
    export PATH=$PATH:$HOME/.cargo/bin
fi

export PATH=$PATH


#terminal colors
if [ -d $HOME/.cache/wal ]
then
    #(/usr/bin/cat $HOME/.cache/wal/sequences &)
fi


# mcfly

if [ $(which mcfly) = "/usr/bin/mcfly" ] 
then
    eval "$(mcfly init zsh)"
fi



# init p10k
if [ -f $HOME/.p10k.zsh  ]
then
    source $HOME/.p10k.zsh
fi
