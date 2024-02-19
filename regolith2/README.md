Custom regolith2 configs.

See https://regolith-desktop.com/docs/using-regolith/configuration/

Main config: /etc/regolith/i3/config
Also includes additional configs:

```
...

# Include any regolith i3 partials
include /usr/share/regolith/common/config.d/*
include /usr/share/regolith/i3/config.d/*

# Include any user i3 partials
include $HOME/.config/regolith2/i3/config.d/*
```

Default keybindings: https://regolith-desktop.com/docs/reference/keybindings/

See also https://regolith-linux.org/docs/howtos/override-xres/
Regolith uses:

File	Optional	Notes
~/.Xresources	Y	Intended for non-Regolith settings
~/.Xresources-regolith	Y	A global override to replace all Regolith settings
/etc/regolith/styles/root	N	The default Regolith Xresources file if ~/.Xresources-regolith does not exist
~/.config/regolith/Xresources	Y	Applies specific overrides to Xresources defaults

It is recommended to use ~/.config/regolith/Xresources for customization as it doesn’t require the specification of redundant settings and is easier to maintain over time.

Configs with keybindings:
- /usr/share/regolith/common/config.d/30_navigation
- /usr/share/regolith/common/config.d/40_workspace-config
- /usr/share/regolith/i3/config.d/60_config_keybindings
- other configs in /usr/share
- /etc/regolith/i3/config

Also, regolith does not redefine a lot of keybingins in own Xresources, mostly using values in the config, like this (from /usr/share/regolith/common/config.d/40_workspace-config):

```
## Modify // Window Layout Mode // <> t ##
set_from_resource $wm.binding.layout_mode wm.binding.layout_mode t
bindsym $mod+$wm.binding.layout_mode layout toggle tabbed splith splitv
```

Here we use `Mod+t` by default and can override that value from `wm.binding.layout_mode` parameter in Xresources.

