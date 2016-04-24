#!/bin/sh

# killall ibus-daemon

# http://faq.i3wm.org/question/2/how-can-i-use-networkmanager-with-i3/
# https://bitbucket.org/aleufroy/dotconfig/src/f45ab42daa54/config/i3/config
# http://www.xgu.ru/wiki/xkb
# https://wiki.archlinux.org/index.php/Keyboard_configuration_in_Xorg
#setxkbmap us,ru -option "grp:caps_toggle,grp_led:caps" -option compose:menu
setxkbmap us,ru,ua -option "grp:caps_toggle,grp_led:caps" -option compose:menu
