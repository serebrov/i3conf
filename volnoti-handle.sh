#!/bin/bash

STEP=5
UNIT="dB"   # dB, %, etc.
CARDNUM=1
VOLUME=$(amixer -c $CARDNUM get Master | grep "Playback.*\[.*%\]" | head -1 | awk '{print $4;}' | sed 's/\[\(.*\)%\]/\1/')
STATE=$(amixer -c $CARDNUM get Master | grep "Playback.*\[.*%\]" | grep -o "\[on\]")
SETVOL="/usr/bin/amixer -qc $CARDNUM set Master"
DIRECTION=$1

echo $VOLUME

case "$1" in
  "up")
          $SETVOL $STEP$UNIT+ unmute
          ;;
  "down")
          $SETVOL $STEP$UNIT- unmute
          ;;
  "mute")
          $SETVOL toggle
          ;;
esac


# Show volume with volnoti
if [[ -n $STATE ]]; then
    volnoti-show $VOLUME
else
    volnoti-show -m
fi

exit 0
