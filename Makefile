# Move workspace to the left display
# $mod+Shift+Left
move_workspace_left:
	i3-msg move workspace to output left

# Move workspace to the right display
# $mod+Shift+Right
move_workspace_right:
	i3-msg move workspace to output right

LAPTOP = $$(xrandr | grep " connected" | grep "^eDP" | awk '{print $$1}')
DELL = $$(xrandr | grep " connected" | grep "^DP" | awk '{print $$1}')

reset-scale-both:
	echo LAP $(LAPTOP)
	# Intel
	# xrandr --output DP-2-1 --auto --scale 1x1 --output eDP-1  --auto --scale 1x1 --right-of DP-2-1
	# Nvidia
	# xrandr --output DP-1-2-1 --auto --scale 1x1 --output eDP-1-1  --auto --scale 1x1 --right-of DP-1-2-1
	xrandr --output $(DELL) --auto --scale 1x1 --output $(LAPTOP)  --auto --scale 1x1 --right-of $(DELL)

scale-both:
	# Resolutions:
	# - Dell: DP-2-1 3840x2160 -> *1.25 = 4800x2700
	# - Laptop: eDP1 2880x1620 -> *1.25 = 3600x2025
	#
	# Virtual screen size (--fb parameter) = 8400 x 2700 (3600+4800 x max(2700, 2925))
	# This is the summary size of external and laptop monitors.
	#
	# First screen displays the area 0-4800x0-2700, second 4800-8400x0-2025.
	# The area is configured with --panning parameter.
	#
	# Now we have the following configuration (check with `xrandr` without parameters):
	# Screen 0: minimum 320 x 200, current 8400 x 2700, maximum 16384 x 16384
	# eDP-1 connected primary 3600x2025+4800+0 (normal left inverted right x axis y axis) 340mm x 190mm panning 3600x2025+4800+0
	# DP-2-1 connected 4800x2700+0+0 (normal left inverted right x axis y axis) 597mm x 336mm panning 4800x2700+0+0
	xrandr --fb 8400x2700 --dpi 216 \
		--output $(DELL) --mode 3840x2160 --scale 1.25x1.25 --panning 4800x2700 \
		--output $(LAPTOP) --mode 2880x1620 --scale 1.25x1.25 --panning 3600x2025+4800+0 --right-of $(DELL)
	# Not sure why, but additional scale set is needed to make laptop screen look properly.
	xrandr --output $(LAPTOP) --scale 1.25x1.25

scale-dell:
	xrandr --output $(DELL) --auto --scale 1.25x1.25 --panning 4800x2700

scale-laptop:
	xrandr --dpi 216 --output $(LAPTOP) --auto --scale 1.25x1.25 --right-of $(DELL)

# scale-both-nvidia:
# 	# Scale doesn't seem to work on nvidia, the virtual sceen size just changes, but doesn't scale
# 	xrandr --fb 8400x2700 --dpi 216
# 	xrandr --output DP-1-2-1 --mode 3840x2160 --scale 1.25x1.25
# 	xrandr --output DP-1-2-1 scale 1.25x1.25 --panning 4800x2700
# 	xrandr --output eDP-1-1 --mode 2880x1620 --scale 1.25x1.25 --panning 3600x2025 --pos 3840x0 --right-of DP-1-2-1
# # 	# Not sure why, but additional scale set is needed to make laptop screen look properly.
# 	# xrandr --output eDP-1-1 --scale 1.25x1.25
