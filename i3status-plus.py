#!/usr/bin/python
#
# Hacked from http://code.stapelberg.de/git/i3status/tree/contrib/wrapper.py
# Initial credits go to Valentin Haenel
#
# 2013 syl20bnr <sylvain.benner@gmail.com>
#
# This program is free software. It comes without any warranty, to the extent
# permitted by applicable law. You can redistribute it and/or modify it under
# the terms of the Do What The Fuck You Want To Public License (WTFPL), Version
# 2, as published by Sam Hocevar. See http://sam.zoy.org/wtfpl/COPYING for more
# details.

from subprocess import Popen, PIPE
import sys
import re
import json
import time

I3STATUS_CMD = "i3status"
LED_STATUSES_CMD = 'xset q | grep "LED mask"'
LED_MASKS = [
    ("caps", 0b0000000001, "CAPS", "#DC322F"),
    ("num", 0b0000000010, "NUM", "#859900"),
    ("scroll", 0b0000000100, "SCROLL", "#2AA198"),
    ("altgr", 0b1111101000, "ALTGR", "#B58900"),
]


def get_led_statuses():
    """ Return a list of dictionaries representing the current keyboard LED
    statuses """
    try:
        p = Popen(LED_STATUSES_CMD, stdout=PIPE, shell=True)
        mask = re.search(r"[0-9]{8}", p.stdout.read())
        if mask:
            v = int(mask.group(0))
            return [to_dict(n, t, c) for n, m, t, c in reversed(LED_MASKS) if v & m]
    except Exception:
        return ""


def to_dict(name, text, color):
    """ Returns a dictionary with given information """
    return {"full_text": text, "name": name, "color": color}


def print_line(message):
    """ Non-buffered printing to stdout. """
    sys.stdout.write(message + "\n")
    sys.stdout.flush()


def read_line(process):
    """ Interrupted respecting reader for stdin. """
    try:
        line = process.stdout.readline().strip()
        if not line:
            sys.exit(3)
        return line
    # exit on ctrl-c
    except KeyboardInterrupt:
        sys.exit()


if __name__ == "__main__":
    p = Popen(I3STATUS_CMD, stdout=PIPE, shell=True, universal_newlines=True)
    # waiting 1 second to get the first lines
    time.sleep(1)
    if p.poll() is None:
        # Skip the first line which contains the version header.
        print_line(read_line(p))
        # The second line contains the start of the infinite array.
        print_line(read_line(p))
    while p.poll() is None:
        line, prefix = read_line(p), ""
        # ignore comma at start of lines
        if line.startswith(","):
            line, prefix = line[1:], ","
        # prepend led statuses
        j = json.loads(line)
        leds = get_led_statuses()
        [(lambda x: j.insert(0, x))(x) for x in leds]
        # and echo back new encoded json
        print_line(prefix + json.dumps(j))
