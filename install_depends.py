#! /usr/bin/python

import os,sys


cache_dir = os.environ["HOME"] + ".local/cache/hypr-dots/"

package_list = [
    "adobe-source-code-pro-fonts",
    "adobe-source-han-fonts",
    "alacritty",
    "auto-cpufreq",
    "base-devel",
    "brave-bin",
    "btop",
    "btrfs-progs",
    "dconf",
    "device-mapper",
    "dkms",
    "find-the-command",
    "fuzzel-git",
    "fzf",
    "gawk",
    "git-credential-manager-core-bin",
    "gnupg",
    "gnome-keyring",
    "grim",
    "grimblast-git",
    "gtk2",
    "gtk3",
    "gtk4",
    "gvfs",
    "gvfs-mtp",
    "gzip",
    "hyprland-git",
    "hyprpicker-git",
    "imv",
    "keyutils",
    "lm_sensors",
    "lua",
    "luajit",
    "lua-language-server",
    "mako",
    "mcfly",
    "mpv",
    "neovim",
    "nwg-look",
    "pamixer",
    "pango",
    "pavucontrol",
    "pipewire",
    "pipewire-alsa",
    "pipewire-pulse",
    "pipewire-jack",
    "playerctl",
    "polkit-gnome",
    "swayidle",
    "swaylock",
    "swww",
    "thunar-extended",
    "thunar-volman",
    "thunar-archive-plugin",
    "ttf-jetbrains-mono-nerd",
    "wireplumber",
    "unzip",
    "waybar-hyprland-git",
    "wget",
    "wofi",
    "x264", "x265",
    "xarchiver",
    "xdg-desktop-portal", "xdg-desktop-portal-hyprland-git",
    "xdg-user-dirs",
    "xdg-utils",
    "xorg-xwayland",
    "zip",
]

def install_package(pkg:str):
    manager:str
    if not os.path.exists("/usr/bin/paru"):
        manager = "pacman"
    else:
        manager = "paru"

    os.system(manager + " -S", + " " + pkg)



def install_dependencies():
    if not os.path.exists("/usr/bin/git"):
        install_package("git");


def install_all():
    pkg_list = " ".join(package_list)
    os.system("paru -S --noconfirm " + pkg_list);

if __name__ == "__main__":
    install_dependencies();

    if not os.path.exists("/usr/bin/paru"):
        print("paru not installed\ninstall it from https://aur.archlinux.org/paru-bin\n");
        exit(1)

    install_all()
