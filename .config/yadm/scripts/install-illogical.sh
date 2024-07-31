#! /bin/bash

url="https://github.com/opticXC/dots.hypr/releases/download/0.01/illogical-impulse.tar.xz"

cache_dir="$HOME/.cache/illogical-impulse"

mkdir -p "$cache_dir"

curl -L "$url" -o "$cache_dir/illogical-impulse.tar.xz"
tar -xf "$cache_dir/illogical-impulse.tar.xz" -C "$cache_dir"

cd "$cache_dir"

pkg_list=$(ls -d */)


for pkg in $pkg_list; do
	cd "$pkg"
	installed=0
	while [ $installed -eq 0 ]; do
		makepkg -si
		if [ $? -eq 0 ]; then
			installed=1
		else
			echo "Failed to install $pkg"
			echo "Do you want to try again? [y/n]"
			read try_again
			if [ "$try_again" != "y" ]; then
				installed=1
			fi
		fi
	done
	cd ..
done


