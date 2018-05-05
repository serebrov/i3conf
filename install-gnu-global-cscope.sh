#!/bin/bash

sudo apt-get install exuberant-ctags python-pygments

mkdir -p ~/build/gnu-global
cd ~/build/gnu-global
wget http://tamacom.com/global/global-6.5.6.tar.gz
tar xvf global-6.5.6.tar.gz
cd global-6.5.6
./configure --with-exuberant-ctags=/usr/bin/ctags
make
sudo make install

cp ~/build/gnu-global/global-6.5.6/gtags.conf ~/.globalrc

mkdir -p ~/build/cscope
cd ~/build/cscope
wget https://sourceforge.net/projects/cscope/files/cscope/15.8b/cscope-15.8b.tar.gz/download -O cscope-15.8b.tar.gz
tar xvf cscope-15.8b.tar.gz
cd cscope-15.8b
./configure
make
sudo make install
