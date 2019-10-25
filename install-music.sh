#!/bin/bash

# see https://ubuntustudio.org/tour/ for audio/video apps available from repositories

# guitarix, rackarrack, qjackctl and gladish (jack will be installed as dependency)
sudo apt-get install -y guitarix rakarrack qjackctl gladish

sudo apt-get install audacity ardour

# alsa-tools-gui is for hdajackretask
sudo apt-get install alsa-tools-gui gnome-alsamixer

# to solve the `can not lock memory error` in guitarix
# or "can not create session" in ardour
# need to re-login to have this working
sudo adduser $USER audio
# check that the above worked with
# $ ulimit -r -l
# it should show:
# -l: locked-in-memory size (kbytes)  unlimited
# -r: max rt priority                 95
