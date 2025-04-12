if status is-interactive
    # Commands to run in interactive sessions can go here
end


alias neofetch "/usr/bin/fastfetch"
alias vi "/usr/bin/nvim"
alias emacs "/usr/bin/emacs -nw"

if test -f /usr/bin/eza
    alias ls "/usr/bin/eza --all --long --git --icons=auto --group-directories-first"
end

if test -f /usr/bin/bat
    alias cat "/usr/bin/bat --style header --style snip --style changes --style header"
end

if test -f /usr/bin/rg
    alias grep "/usr/bin/rg"
end


# Path Manipulation
if test -d $HOME/.local/bin
    set -U fish_user_paths $fish_user_paths $HOME/.local/bin
end


if test -d $HOME/.cargo/bin
	set -U fish_user_paths $fish_user_paths $HOME/.cargo/bin
end

if test -d $HOME/go/bin
	set -U fish_user_paths $fish_user_paths $HOME/go/bin
end
