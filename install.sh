!/bin/bash

sudo apt-get update
sudo apt-get dist-upgrade

# git
sudo apt-get -y install git-core git-doc git-gui
# zsh
sudo apt-get -y install zsh zsh-doc
# tmux and byobu
sudo apt-get -y install tmux # byobu
# log navigation
sudo apt-get -y install lnav
# disk space analyzer
sudo apt-get -y install ncdu

# vim
# https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
sudo apt-get -y install libncurses5-dev libgnome2-dev libgnomeui-dev \
libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev ruby-dev mercurial
sudo apt-get -y install checkinstall
sudo apt-get -y install ctags cmake

# google chrome
# http://www.howopensource.com/2011/10/install-google-chrome-in-ubuntu-11-10-11-04-10-10-10-04/
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
sudo apt-get -y install google-chrome-stable
#sudo apt-get install google-chrome-beta

# Oracle java
# http://www.webupd8.org/2012/01/install-oracle-java-jdk-7-in-ubuntu-via.html
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get -y install oracle-java8-installer
sudo mkdir /opt/google/chrome/plugins
sudo ln -s /usr/lib/jvm/java-7-oracle/jre/lib/amd64/libnpjp2.so /opt/google/chrome/plugins/libnpjp2.so

# python and pip
sudo apt-get -y install python-pip python-dev python3-pip python3-dev build-essential 
sudo pip2 install --upgrade pip 
sudo pip2 install --upgrade virtualenv 
sudo pip2 install --upgrade virtualenvwrapper
sudo pip3 install --upgrade pip 
sudo pip3 install --upgrade virtualenv 
sudo pip3 install --upgrade virtualenvwrapper

# node and php are useful from the command line
sudo apt-get -y install nodejs npm nodejs-legacy
sudo apt-get install php7.0

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
# https://docs.docker.com/engine/installation/linux/ubuntulinux/
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo sh -c 'echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" >> /etc/apt/sources.list.d/docker.list'
sudo apt-get update
sudo apt-get -y install docker-engine
# add current user to the 'docker' group (need to logout / login to take the effect)
sudo usermod -aG docker $USER
sudo sh -c 'curl -L https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose'
sudo chmod +x /usr/local/bin/docker-compose
sudo sh -c 'curl -L https://github.com/docker/machine/releases/download/v0.7.0/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine'
sudo chmod +x /usr/local/bin/docker-machine
# switch docker to overlay fs
sudo modprobe overlay
# for upstart
sudo sh -c 'echo "DOCKER_OPTS=\"--storage-driver=overlay\"" >> /etc/default/docker'
# for systemd, see http://ciplogic.com/index.php/blog/109-docker-with-overlayfs-on-ubuntu-16-04-lts
sudo CONFIGURATION_FILE=$(systemctl show --property=FragmentPath docker | cut -f2 -d=) \
     cp $CONFIGURATION_FILE /etc/systemd/system/docker.service
sudo service docker stop
sudo perl -pi -e 's/^(ExecStart=.+)$/$1 -s overlay/' /etc/systemd/system/docker.service
sudo systemctl daemon-reload
sudo service docker start

###### i3 + gnome3
# http://blog.hugochinchilla.net/2013/03/using-gnome-3-with-i3-window-manager/
sudo echo "deb http://debian.sur5r.net/i3/ $(lsb_release -c -s) universe" >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get --allow-unauthenticated install sur5r-keyring
sudo apt-get update
sudo apt-get -y install gnome-session gnome-panel i3
sudo apt-get -y install classicmenu-indicator feh curl
sudo chmod +x ~/.i3/autostart
# nautilus - don't launch desktop
gsettings set org.gnome.desktop.background show-desktop-icons false
ln -s ~/.i3/.i3status.conf ~/.i3status.conf

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
# shutter - screenshot tool (binded to Win+Print)
# gmrun - app runner dialog (Win + G)
sudo apt-get -y install feh scrot shutter gmrun
sudo apt-get -y install xbacklight xclip

# byzanz-record --delay=2 --duration=30 screencast.gif - record a screencast to gif
# byzanz-record --duration=15 --x=200 --y=300 --width=700 --height=400 - record specific area
sudo apt-get -y install byzanz

sudo apt-get -y install dbus
sudo apt-get -y install libdbus-glib-1-dev

# used to get battery level
sudo apt-get -y install acpi

# Wicd is an open source wired and wireless network manager for Linux
#sudo apt-get -y install wicd

# Edit mp3 / ogg tags (use the ~/.i3/tagedit.sh *.mp3 to edit tags in vim)
sudo apt-get -y install id3v2

# https://github.com/cknadler/vim-anywhere
# useful to edit text in vim for external apps
# Win+I (configured in ~/.i3/config) will open vim, write the text, save and close
# the text will be copied to clipboard and previous app focused
curl -fsSL https://raw.github.com/cknadler/vim-anywhere/master/install | bash

### Graphical disk map
sudo apt-get -y install gdmap

### htop
sudo apt-get -y install htop

### ranger
sudo apt-get -y install ranger

### Sound settings
# alsa-tools-gui is for hdajackretask
sudo apt-get install alsa-tools-gui pavucontrol gnome-alsamixer

#### Install Volnoti (handles Win + '+' / Win + '-' to control sound level)
cd ~
git clone git://github.com/davidbrazdil/volnoti.git
cd volnoti

# handle volnoti error, see http://ubuntuforums.org/showthread.php?t=2215264
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

### ISO, MDF, etc
# Simple
sudo apt-get -y install furiusisomount 
# Full-featured, no version for ubuntu 14.10 in the ppa yet
sudo sh -c 'echo "deb http://ppa.launchpad.net/cdemu/ppa/ubuntu trusty main" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb-src http://ppa.launchpad.net/cdemu/ppa/ubuntu trusty main" >> /etc/apt/sources.list'
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D782A00F
sudo apt-get update
sudo apt-get -y install gcdemu cdemu-client cdemu-daemon


# https://www.passwordstore.org/
sudo apt-get install pass

#KeePassXC
sudo add-apt-repository -y ppa:phoerious/keepassxc
sudo apt-get update
sudo apt-get install -y keepassxc


# https://help.ubuntu.com/community/SwapFaq
# The default setting in Ubuntu is swappiness=60. 
# Reducing the default value of swappiness will probably improve overall performance for a typical Ubuntu desktop installation. 
# A value of swappiness=10 is recommended, but feel free to experiment. 
# 
# That's great, recommended value is 10 and default is 60
# My machine works much better with 10
# echo "vm.swappiness=10" | sudo sh -c 'cat >> /etc/sysctl.conf'
