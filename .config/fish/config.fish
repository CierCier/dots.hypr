
if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

end



# Load find-the-command if available
if test -d /usr/share/doc/find-the-command
    source /usr/share/doc/find-the-command/ftc.fish
end

# Set editor preferences
if test -f /usr/bin/nvim
    set -x VISUAL nvim
    set -x EDITOR nvim
else if test -f /usr/bin/vim
    set -x VISUAL vim
    set -x EDITOR vim
else
    set -x VISUAL vi
    set -x EDITOR vi
end

# Aliases
alias neofetch="/usr/bin/fastfetch"

if test -f /usr/bin/eza
    alias ls="/usr/bin/eza --all --long --git --icons=auto --group-directories-first"
end

if test -f /usr/bin/bat
    alias cat="/usr/bin/bat --style header --style snip --style changes --style header"
end

if test -f /usr/bin/rg
    alias grep="/usr/bin/rg"
end

if test -f /usr/bin/trash
    alias rm="/usr/bin/trash"
end

# Path Manipulation
set -x PATH $PATH

if test -d $HOME/.local/bin
    set -x PATH $PATH $HOME/.local/bin
end

if test -d $HOME/.cargo/bin
    set -x PATH $PATH $HOME/.cargo/bin
end

if test -d /opt/flutter
    set -x PATH $PATH /opt/flutter/bin
end

if test -d $HOME/.ghcup/bin
    set -x PATH $PATH $HOME/.ghcup/bin
end

if test -d $HOME/.bun/bin
    set -x PATH $PATH $HOME/.bun/bin
end

if test -d $HOME/.encore/bin
    set -x PATH $PATH $HOME/.encore/bin
end

if test -d $HOME/go/bin
    set -x PATH $PATH $HOME/go/bin
end

# McFly
if command -v mcfly >/dev/null
    set -x MCFLY_KEY_SCHEME vim
    set -x MCFLY_FUZZY 2
    mcfly init fish | source
end

# Zoxide
if command -v zoxide >/dev/null
    zoxide init fish | source
end

# OPAM
if test -d $HOME/.opam
    eval (opam env --switch=default --shell=fish)
end

# Arch Linux Mirror Update
if test (command -v lsb_release) >/dev/null
    set OS_ID (lsb_release -si)
    if test $OS_ID = "Arch"
        function update-mirrors
            sudo /usr/bin/reflector --latest 15 --age 15 --sort rate --connection-timeout 15 --download-timeout 15 --save /etc/pacman.d/mirrorlist --verbose
        end
    end
end



set --global fish_prompt_pwd_dir_length 10

set -g async_prompt_functions _pure_prompt_git

set -g pure_show_system_time false
set -g pure_enable_single_line_prompt true
set -g pure_separate_prompt_on_error true
