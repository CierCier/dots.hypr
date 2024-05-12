#! /bin/bash
#
echo "Replace makepkg.conf"
sudo echo "Got sudo"

if [ -z "$1" ];
	microarch="native"
else
	microarch=$1
fi
 
echo "Using microarchitecture: $microarch"

echo "Backing up makepkg.conf"
mv /etc/makepkg.conf /etc/makepkg.conf.bak
echo "Copying makepkg.conf"
cp $HOME/.config/yadm/root/etc/makepkg.conf /etc/makepkg.conf

echo "Setting microarchitecture to $microarch"

sed -i "s/{microarch}/$microarch/g" /etc/makepkg.conf

echo "Replaced makepkg.conf"
