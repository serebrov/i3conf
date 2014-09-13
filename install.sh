#!/bin/bash

sudo apt-get -y install feh scrot shutter gmrun
sudo apt-get -y install xbacklight xclip

sudo apt-get -y install dbus
sudo apt-get -y install libdbus-glib-1-dev

sudo apt-get -y install acpi

# Wicd is an open source wired and wireless network manager for Linux
sudo apt-get -y install wicd

#https://github.com/cknadler/vim-anywhere
curl -fsSL https://raw.github.com/cknadler/vim-anywhere/master/install | bash

cd ~
git clone git://github.com/davidbrazdil/volnoti.git
cd volnoti

# handle error, see http://ubuntuforums.org/showthread.php?t=2215264
cd src
rm value-client-stub.h && make value-client-stub.h 
dbus-binding-tool --prefix=volume_object --mode=glib-client \
      specs.xml > value-client-stub.h
rm value-daemon-stub.h && make value-daemon-stub.h 
dbus-binding-tool --prefix=volume_object --mode=glib-server \
      specs.xml > value-daemon-stub.h
cd ..
#Let Autotools create the configuration scripts:
./prepare.sh
#Then just follow the basic GNU routine:
./configure --prefix=/usr
make
sudo make install
#You can have the .tar.gz source archive prepared simply by calling a provided script:
#./package.sh
