#!/bin/sh

ID=`xinput list | grep -Eo 'TouchPad\s*id\=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}'`
STATE=`xinput list-props $ID|grep 'Device Enabled'|awk '{print $4}'`
if [ $STATE -eq 1 ]
then
      xinput disable $ID
      echo "Touchpad disabled."
      /usr/bin/notify-send "Touchpad disabled."
else
      xinput enable $ID
      echo "Touchpad enabled."
      /usr/bin/notify-send "Touchpad enabled."
fi
