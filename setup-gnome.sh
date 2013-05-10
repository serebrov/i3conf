#!/bin/sh

# see
# https://faq.i3wm.org/question/346/how-can-i-use-i3-in-gnome-2-de/
# http://blog.hugochinchilla.net/2013/03/using-gnome-3-with-i3-window-manager/
# http://askubuntu.com/questions/26115/i3-wm-with-auto-internet-connectivity-and-a-gnome-panel

gconftool-2 -s /desktop/gnome/session/required_components/windowmanager i3 --type string
gconftool-2 -s /apps/nautilus/preferences/show_desktop false --type boolean
