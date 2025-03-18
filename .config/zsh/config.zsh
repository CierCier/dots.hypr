#! /usr/bin/zsh

if [ -d /ust/share/doc/find-the-command ]
then
    source /usr/share/doc/find-the-command/ftc.zsh
fi


if [ -f /usr/bin/nvim ]
then
	export VISUAL=nvim
	export EDITOR=nvim
elif [ -f /usr/bin/vim ]
then
	export VISUAL=vim
	export EDITOR=vim
else
	export VISUAL=vi
	export EDITOR=vi
fi


# Aliases
alias neofetch="/usr/bin/fastfetch"

if [ -f /usr/bin/eza ]
then
	alias ls="/usr/bin/eza --all --long --git --icons=auto --group-directories-first"
fi

if [ -f /usr/bin/bat ]
then
	alias cat="/usr/bin/bat --style header --style snip --style changes --style header"
fi

if [ -f /usr/bin/rg ]
then
	alias grep="/usr/bin/rg"
fi

if [ -f /usr/bin/trash  ]
then
	alias rm="/usr/bin/trash"
fi


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

if [ -d $HOME/go ]
then
	PATH+=:$HOME/go/bin
fi


export PATH=$PATH


## terminal colors
## Not recommended
## Ruins standard 16 colors in most cases
#if [ -d $HOME/.cache/wal ]
#then
#    (/usr/bin/cat $HOME/.cache/wal/sequences &)
#fi


if [ -f "$(which mcfly)" ] 
then
    export MCFLY_KEY_SCHEME=vim
    export MCFLY_FUZZY=2
    eval "$(mcfly init zsh)"
fi

if [ -f "$(which zoxide)" ]
then
	eval "$(zoxide init zsh)"
fi


function osc7-pwd() {
    emulate -L zsh # also sets localoptions for us
    setopt extendedglob
    local LC_ALL=C
    printf '\e]7;file://%s%s\e\' $HOST ${PWD//(#m)([^@-Za-z&-;_~])/%${(l:2::0:)$(([##16]#MATCH))}}
}

function chpwd-osc7-pwd() {
    (( ZSH_SUBSHELL )) || osc7-pwd
}
add-zsh-hook -Uz chpwd chpwd-osc7-pwd


if [ -d $HOME/.opam ]
then
	eval $(opam env --switch=default --shell=zsh)
fi



OS_ID=$(/usr/bin/lsb_release -si)
if [ $OS_ID = "Arch" ]
then
	update-mirrors(){
		sudo /usr/bin/reflector --latest 15 --age 15 --sort rate --connection-timeout 15 --download-timeout 15  --save /etc/pacman.d/mirrorlist --verbose
	}
fi

## Plugins

if [ -f /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]
then
	source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
fi

if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]
then
	ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bold,underline"
	ZSH_AUTOSUGGEST_STRATEGY=(history completion)
	source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh  ] 
then
	source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
	
	bindkey              '^I'         menu-complete
	bindkey "$terminfo[kcbt]" reverse-menu-complete

fi

