#!/bin/sh

sudo su

sync; echo 3 > /proc/sys/vm/drop_caches

echo "vm.swappiness=10" >> /etc/sysctl.conf
sysctl -p

echo "unset HISTFILE" >> /etc/bash.bashrc

echo "QT_QPA_PLATFORMTHEME=gtk2" >> /etc/environment
echo "QT_STYLE_OVERRIDE=gtk2" >> /etc/environment

apt -y purge gstreamer1.0-fluendo-mp3 snapd whoopsie whoopsie-preferences

echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
apt -y install ttf-mscorefonts-installer || exit 1

apt -y install ubuntu-restricted-extras || exit 1
apt -y install binutils bison flex gcc gcc-multilib g++ make nasm || exit 1

apt -y install gettext git imagemagick libncursesw5 qt5-style-plugins p7zip-full p7zip-rar pkg-config sqlite3 texinfo webp xdg-utils || exit 1
apt -y install qemu qemu-block-extra qemu-kvm qemu-slof qemu-system qemu-user qemu-utils || exit 1
apt -y install bochs bochsbios bochs-x vgabios || exit 1
apt -y install gdebi-core ghex isomaster python3 python3-pip || exit 1

apt -y purge --autoremove
exit

mkdir -p ~/.config ~/.fonts
wget -qO- http://plasmasturm.org/code/vistafonts-installer/vistafonts-installer | bash

echo "[QT]" >> ~/.config/Trolltech.conf
echo "style=GTK+" >> ~/.config/Trolltech.conf
