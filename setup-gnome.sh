#!/bin/sh

# see
# http://blog.hugochinchilla.net/2013/03/using-gnome-3-with-i3-window-manager/
# https://faq.i3wm.org/question/346/how-can-i-use-i3-in-gnome-2-de/
# http://askubuntu.com/questions/26115/i3-wm-with-auto-internet-connectivity-and-a-gnome-panel

# it can be necessary to install gnome-panel
# sudo apt-get install gnome-panel
# of (maybe better?)
# sudo apt-get install gnome-session-fallback

#gconftool-2 -s /desktop/gnome/session/required_components/windowmanager i3 --type string
#gconftool-2 -s /apps/nautilus/preferences/show_desktop false --type boolean

gsettings set org.gnome.desktop.background show-desktop-icons false

#remove bottom panel
# run dconf-editor
# org - gnome - gnome-panel - layout
# change ['top-panel','bottom-panel'] - ['top-panel']

#auto hide top panel
# run dconf-editor
# org - gnome - gnome-panel - layout - toplevels - top-panel
# change auto-hide

cp gnome-i3.desktop /usr/share/xsessions/gnome-i3.desktop
cp gnome-i3.session /usr/share/gnome-session/sessions/gnome-i3.session
