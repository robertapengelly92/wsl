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
apt -y install binutils bison flex gcc gcc-multilib g++ make mingw-w64 nasm || exit 1

apt -y install gettext git imagemagick libncursesw5 qt5-style-plugins p7zip-full p7zip-rar pkg-config sqlite3 subversion texinfo webp xdg-utils xorriso || exit 1
apt -y install qemu qemu-block-extra qemu-kvm qemu-slof qemu-system qemu-user qemu-utils || exit 1
apt -y install bochs bochsbios bochs-x vgabios || exit 1
apt -y install gdebi-core ghex isomaster python3 python3-pip || exit 1

mkdir /usr/share/desktop-directories

wget -P /tmp https://raw.githubusercontent.com/robertapengelly92/hopper/main/Hopper%20Disassembler%20v4.7.7/Hopper-v4-4.7.7-Linux.deb
wget -P /tmp https://raw.githubusercontent.com/robertapengelly92/hopper/main/Hopper%20Disassembler%20v4.7.7/patch-hopper.py

gdebi -n /tmp/Hopper-v4-4.7.7-Linux.deb
python3 /tmp/patch-hopper.py /opt/hopper-v4/bin/Hopper

apt -y purge --autoremove
exit

mkdir -p ~/.config ~/.fonts
wget -qO- http://plasmasturm.org/code/vistafonts-installer/vistafonts-installer | bash

echo "[QT]" >> ~/.config/Trolltech.conf
echo "style=GTK+" >> ~/.config/Trolltech.conf
