if [ -z "$1" ]; then
	microarch=$(/usr/lib/ld-linux-x86-64.so.2 --help | grep 'supported' | awk 'NR==1 {print $1}')
else
	microarch=$1
fi

echo "Installing ALHP keyring and mirrorlist from the AUR"
paru -S --noconfirm alhp-keyring alhp-mirrorlist

start_line=$(grep -n "^\[core\]" /etc/pacman.conf | cut -d: -f1)
echo "Adding ALHP core-$microarch repo to pacman.conf"
sudo sed -i "${start_line}i [core-$microarch]\nSigLevel = Optional \nInclude = /etc/pacman.d/alhp-mirrorlist" /etc/pacman.conf

start_line=$(grep -n "^\[extra\]" /etc/pacman.conf | cut -d: -f1)
echo "Adding ALHP extra-$microarch repo to pacman.conf"
sudo sed -i "${start_line}i [extra-$microarch]\nSigLevel = Optional \nInclude = /etc/pacman.d/alhp-mirrorlist" /etc/pacman.conf

if grep -q "^\[multilib\]" /etc/pacman.conf; then
	echo "Adding ALHP multilib-$microarch repo to pacman.conf"
	start_line=$(grep -n "^\[multilib\]" /etc/pacman.conf | cut -d: -f1)
	sudo sed -i "${start_line}i [multilib-$microarch]\nSigLevel = Optional \nInclude = /etc/pacman.d/alhp-mirrorlist" /etc/pacman.conf
else
	echo "Enabling multilib repo"
	sudo sed -i 's/#\[multilib\]/\[multilib\]/g' /etc/pacman.conf
	sudo sed -i 's/#Include = \/etc\/pacman.d\/mirrorlist/Include = \/etc\/pacman.d\/mirrorlist/g' /etc/pacman.conf
fi
