!/bin/bash

sudo apt-get update
sudo apt-get dist-upgrade

# git
sudo apt-get -y install curl git-core git-doc git-gui
# zsh
sudo apt-get -y install zsh zsh-doc
# tmux and byobu
sudo apt-get -y install tmux # byobu
# log navigation
# sudo apt-get -y install lnav
# disk space analyzer
# sudo apt-get -y install ncdu

sudo apt -y install gnome-tweaks

# Custom fonts.
mkdir -p ~/.fonts
cp -r ~/.i3/fonts/* ~/.fonts
fc-cache -f -v

sudo apt-get -y install fonts-firacode
# sudo apt install fonts-dejavu fonts-hack fonts-mona fonts-monoid fonts-mononoki fonts-roboto fonts-tlwg-mono

# https://linuxconfig.org/how-to-install-the-nvidia-drivers-on-ubuntu-18-04-bionic-beaver-linux
sudo ubuntu-drivers autoinstall

# vim
# https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
# sudo apt-get -y install libncurses5-dev libgnome2-dev libgnomeui-dev \
# libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
# libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial
# sudo apt-get -y install checkinstall
# sudo apt-get -y install cmake
sudo apt-get -y install exuberant-ctags

sudo apt-get -y install kdiff3 konsole

# Redshift adjusts the color temperature of your screen according to your surroundings.
# This may help your eyes hurt less if you are working in front of the screen at night.
# https://github.com/jonls/redshift
# Example: redshift -v -l geoclue2
# Dry run: redshift -v -l geoclue2 -p
sudo apt-get -y install redshift

# google chrome
# http://www.howopensource.com/2011/10/install-google-chrome-in-ubuntu-11-10-11-04-10-10-10-04/
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
sudo apt-get -y install google-chrome-stable
#sudo apt-get install google-chrome-beta

# Oracle java
# http://www.webupd8.org/2012/01/install-oracle-java-jdk-7-in-ubuntu-via.html
# sudo add-apt-repository ppa:webupd8team/java
# sudo apt-get update
# sudo apt-get -y install oracle-java8-installer
# sudo mkdir /opt/google/chrome/plugins
# sudo ln -s /usr/lib/jvm/java-7-oracle/jre/lib/amd64/libnpjp2.so /opt/google/chrome/plugins/libnpjp2.so

# python and pip
# sudo apt-get -y install python-pip python-dev
sudo apt-get -y install python3-pip python3-dev build-essential python-is-python3
# sudo pip2 install --upgrade pip
# sudo pip2 install --upgrade virtualenv
# sudo pip2 install --upgrade virtualenvwrapper
sudo pip3 install --upgrade pip
sudo pip3 install --upgrade virtualenv
# sudo pip3 install --upgrade virtualenvwrappe

# Markdown viewer
# https://github.com/axiros/terminal_markdown_viewer
# Example:
#   mdv README.md
# Note: better use on dark background.
sudo pip3 install --upgrade mdv

# Corrects previous command after error
# https://github.com/nvbn/thefuck
sudo pip3 install --upgrade thefuck

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
# node
nvm install 12

# syncthing
# Add the release PGP keys:
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
# Add the "stable" channel to your APT sources:
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
# Update and install syncthing:
sudo apt update
sudo apt -y install syncthing

# node and php are useful from the command line
# sudo apt-get -y install nodejs npm nodejs-legacy
# sudo apt-get install php7.0

#apache, php, mysql -> use docker instead
# sudo apt-get -y install apache2
# sudo adduser $USER www-data
# sudo adduser www-data $USER
# sudo apt-get -y install php5 php5-dev php5-gd php5-curl php5-json php5-mysql php5-xdebug
# sudo apt-get -y install phpunit phpunit-mock-object phpunit-selenium phpunit-story
# sudo apt-get -y install mysql-server
#redis
# sudo apt-get -y install redis-server
#varnish
# sudo apt-get -y install varnish

##### docker
# Install docker and docker-compose (official Ubuntu repository)
sudo apt -y install docker-compose

# https://docs.docker.com/engine/installation/linux/ubuntulinux/
# sudo apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common

# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# sudo apt-get update
# sudo apt-get -y install docker-ce


# Allow to use docker without sudo, logout/login or reboot to make it work
sudo groupadd docker
sudo usermod -aG docker $USER

# Docker compose
# sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# To install 
# sudo chmod +x /usr/local/bin/docker-compose

###### i3 + gnome3
# http://blog.hugochinchilla.net/2013/03/using-gnome-3-with-i3-window-manager/

# /usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2019.02.01_all.deb keyring.deb SHA256:176af52de1a976f103f9809920d80d02411ac5e763f695327de9fa6aff23f416
# sudo dpkg -i ./keyring.deb
# sudo echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list
# sudo apt update
# # gnome-flashback is needed in 18.04, see https://github.com/csxr/i3-gnome/wiki/Tips-&-Tricks
# sudo apt -y install i3 gnome-flashback gnome-panel
# 
# pushd ~/
#   # gnome+i3 session
#   git clone https://github.com/csxr/i3-gnome.git
#   cd i3-gnome
#   sudo make install
# popd

# sudo apt-get -y install classicmenu-indicator

sudo chmod +x ~/.i3/autostart
# nautilus - don't launch desktop
# gsettings set org.gnome.desktop.background show-desktop-icons false
ln -s ~/.i3/.i3status.conf ~/.i3status.conf

# Regolith (i3 "bundle")

# Beta releases
# sudo add-apt-repository -y ppa:kgilmer/regolith-stable
# sudo apt install regolith-desktop

sudo add-apt-repository ppa:regolith-linux/release
sudo apt install regolith-desktop i3xrocks-net-traffic i3xrocks-cpu-usage i3xrocks-time

ln -s ~/.i3/regolith/i3 ~/.config/regolith/i3
ln -s ~/.i3/regolith/.Xresources-regolith ~/.Xresources-regolith

#renameutils - Programs to make file renaming easier
#http://www.nongnu.org/renameutils/
sudo apt-get -y install renameutils
#https://joeyh.name/code/moreutils/
sudo apt-get -y install moreutils

#ag - the silver searcher
#repo version is too old
#sudo apt-get install silversearcher-ag
mkdir -p ~/ag_build
pushd ~/ag_build
  sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
  git clone git@github.com:ggreer/the_silver_searcher.git
  cd the_silver_searcher
  ./build.sh
  sudo make install
popd

# fzf - command-line fuzzy finder
# CTRL-T - Paste the selected file path(s) into the command line
# CTRL-R - Paste the selected command from history into the command line
# - Sort is disabled by default to respect chronological ordering
# - Press CTRL-R again to toggle sort
# ALT-C - cd into the selected directory
git clone https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# feh - image viewer
# scrot - make a screenthot (binded to Print key in i3 config)
# rofi - app runner dialog (Win + Space)
sudo apt-get -y install feh rofi # scrot gmrun
sudo apt-get -y install xbacklight xclip

# shutter - screenshot tool (binded to Win+Print)
# note: shutter is not in official repo anymore, an alternative is flameshot
sudo add-apt-repository ppa:linuxuprising/shutter
sudo apt-get -y install shutter
# # The shutter dependency that is missing in Ubuntu 18.04 repositories
# mkdir ~/libgoo-canvas-perl
# pushd ~/libgoo-canvas-perl
# wget http://archive.ubuntu.com/ubuntu/pool/universe/libg/libgoo-canvas-perl/libgoo-canvas-perl_0.06-2ubuntu3_amd64.deb
# wget http://archive.ubuntu.com/ubuntu/pool/universe/libe/libextutils-depends-perl/libextutils-depends-perl_0.405-1_all.deb
# wget http://archive.ubuntu.com/ubuntu/pool/universe/libe/libextutils-pkgconfig-perl/libextutils-pkgconfig-perl_1.15-1_all.deb
# wget http://archive.ubuntu.com/ubuntu/pool/universe/g/goocanvas/libgoocanvas3_1.0.0-1_amd64.deb
# wget http://archive.ubuntu.com/ubuntu/pool/universe/g/goocanvas/libgoocanvas-common_1.0.0-1_all.deb
# sudo dpkg -i *.deb
# sudo apt install -f
# popd

# byzanz-record --delay=2 --duration=30 screencast.gif - record a screencast to gif
# byzanz-record --duration=15 --x=200 --y=300 --width=700 --height=400 - record specific area
sudo apt-get -y install byzanz

# sudo apt-get -y install dbus
# sudo apt-get -y install libdbus-glib-1-dev

# to get battery level: acpi -V
sudo apt-get -y install acpi

# Wicd is an open source wired and wireless network manager for Linux
#sudo apt-get -y install wicd

# Edit mp3 / ogg tags (use the ~/.i3/tagedit.sh *.mp3 to edit tags in vim)
# sudo apt-get -y install id3v2

# https://github.com/cknadler/vim-anywhere
# useful to edit text in vim for external apps
# Win+I (configured in ~/.i3/config) will open vim, write the text, save and close
# the text will be copied to clipboard and previous app focused
# curl -fsSL https://raw.github.com/cknadler/vim-anywhere/master/install | bash

### Graphical disk map
sudo apt-get -y install gdmap

### htop
sudo apt-get -y install htop

### ranger
sudo apt-get -y install ranger

### Sound settings
sudo apt-get install pavucontrol

#### Install Volnoti (handles Win + '+' / Win + '-' to control sound level)
# cd ~
# git clone git://github.com/davidbrazdil/volnoti.git
# cd volnoti

# handle volnoti error, see http://ubuntuforums.org/showthread.php?t=2215264
# cd src
# rm value-client-stub.h && make value-client-stub.h 
# dbus-binding-tool --prefix=volume_object --mode=glib-client \
#       specs.xml > value-client-stub.h
# rm value-daemon-stub.h && make value-daemon-stub.h 
# dbus-binding-tool --prefix=volume_object --mode=glib-server \
#       specs.xml > value-daemon-stub.h
# cd ..
#Let Autotools create the configuration scripts:
# ./prepare.sh
#Then just follow the basic GNU routine:
# ./configure --prefix=/usr
# make
# sudo make install
#You can have the .tar.gz source archive prepared simply by calling a provided script:
#./package.sh

### ISO, MDF, etc
# Simple
# sudo apt-get -y install furiusisomount 
# Full-featured, no version for ubuntu 14.10 in the ppa yet
# sudo sh -c 'echo "deb http://ppa.launchpad.net/cdemu/ppa/ubuntu trusty main" >> /etc/apt/sources.list'
# sudo sh -c 'echo "deb-src http://ppa.launchpad.net/cdemu/ppa/ubuntu trusty main" >> /etc/apt/sources.list'
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D782A00F
# sudo apt-get update
# sudo apt-get -y install gcdemu cdemu-client cdemu-daemon


# https://www.passwordstore.org/
# sudo apt-get install pass

#KeePassXC
sudo snap install keepassxc

# Rust (update with `rustup update`)
# curl https://sh.rustup.rs -sSf | sh
# improved ls (in rust)
# cargo install exa


# https://help.ubuntu.com/community/SwapFaq
# The default setting in Ubuntu is swappiness=60. 
# Reducing the default value of swappiness will probably improve overall performance for a typical Ubuntu desktop installation. 
# A value of swappiness=10 is recommended, but feel free to experiment. 
# 
# That's great, recommended value is 10 and default is 60
# My machine works much better with 10
# echo "vm.swappiness=10" | sudo sh -c 'cat >> /etc/sysctl.conf'
# echo current value
# cat /proc/sys/vm/swappiness

# Update inotify max watches
# echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
# Show current value
# cat /proc/sys/fs/inotify/max_user_watches

sudo apt -y install pv
clear ; for t in "Wake up" "The Matrix has you" "Follow the white rabbit" "Knock, knock";do clear;pv -qL10 <<<$'\e[2J'$'\e[32m'$t$'\e[37m';sleep 5;done
