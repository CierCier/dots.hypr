---
#Simple dotfiles for a Hyprland setup targeted for Arch based systems
---

#### Notes
> Before starting, its highly recommended to create a fork of the repo and use that.

> The bootstrap script uses and installs paru by default. can be easily edited.

> Edit pkglist.txt and pkglist_aur.txt in .config/yadm. only keep things that you need.

> ALHP repos are not recommended for most use cases, the performace benefits are not very prominent outside encryption algorithms.

> The bootstrap script makes changes to the /etc/makepkg.conf , making PKGBUILDS use "non standard" options.
```
> change CFLAGS and RUSTFLAGS to optimise builds for cpu micro-architecture
> change PKGDEST, SRCDEST and SRCPKGDEST to users cache directory ~/.cache/makepkg/{src,pkgs,srcpkgs}
> change MAKEFLAGS to use all available threads
```

### Using

simply install yadm and use it to clone the repo or your own fork of it 
```
sudo pacman -S yadm
yadm clone https://github.com/opticXC/dots.hypr.git
```
and then run the bootstrap script

```
yadm bootstrap
```
if the script fails to launch
make sure that .config/yadm/bootstrap is an executable
```
chmod +x ~/.config/yadm/bootstrap
```
and then, run yadm bootstrap again




