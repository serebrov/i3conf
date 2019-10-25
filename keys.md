# vim: set ts=64:
Regolith Linux
Keybindings
Action	Key Binding
Launch Terminal	⊞ Win-Enter
Launch Browser	⊞ Win-Shift-Enter
App Launcher	⊞ Win-Space
Command Launcher	⊞ Win-Shift-Space
Window Navigate	⊞ Win-Ctrl-Space
Move between Windows	⊞ Win-Arrow Keys or vim keys
Move Windows	⊞ Win-Shift-Arrow Keys or vim keys
Toggle Vertical and Horizontal Layout Mode	⊞ Win-Backspace
Focused Window Fullscreen Toggle	⊞ Win-f
Focused Window Float Toggle	⊞ Win-Shift-F
Increase or Decrease Window Gaps	⊞ Win-+ and -
Toggle Keybinding Helper	⊞ Win-Shift-?
Focused Window Floating Toggle	⊞ Win-Shift-F
Move to Workspace 1 - 10	⊞ Win-1 - 0
Move to Workspace 10 - 19	⊞ Win-Ctrl-1 - 9
Take to Workspace 1 - 10	⊞ Win-Alt-1 - 0
Take to Workspace 10 - 19	⊞ Win-Ctrl-Alt-1 - 9
Move to Next Workspace	⊞ Win-Tab
Move to Previous Workspace	⊞ Win-Shift-Tab
Layout Toggle (tabbed, horizontal, vertical)	⊞ Win-t
Reload i3 Config	⊞ Win-Shift-C
Control Panel	⊞ Win-c
Configure Bluetooth	⊞ Win-b
Configure Displays	⊞ Win-d
Configure Network	⊞ Win-n
Configure Power	⊞ Win-p
Configure Sound	⊞ Win-s
Configure Wifi	⊞ Win-w
Enter Window Resize Mode	⊞ Win-r
Change Window Size in Resize Mode	⊞ Win-arrow keys
Exit Resize Mode	Escape or Enter
Close Terminal	Ctrl-d
Close (Some) Windows	Ctrl-w
Exit (Some) Apps	Ctrl-q
Exit Session	⊞ Win-Shift-E
Suspend Computer	⊞ Win-Shift-S
Reboot Computer	⊞ Win-Shift-B
Power Off Computer	⊞ Win-Shift-P

Restart i3 inplace  Win-Shift-R

# Changes
Kill Focused Window	⊞ Win-q
bindsym $mod+a focus parent
bindsym $mod+Shift+Left move workspace to output left
bindsym $mod+Shift+Right move workspace to output right

mod-u utils menu

#
# # http://i3wm.org/docs/user-contributed/lzap-config.html
# # border changing
# bindsym $mod+b border toggle
# # scratchpad
# bindsym $mod+m move scratchpad
# bindsym $mod+o scratchpad show
