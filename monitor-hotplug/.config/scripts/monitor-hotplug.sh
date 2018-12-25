#!/bin/bash

# Find the status of the outputs
dp1_status=$(cat /sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-DP-1/status)
dp2_status=$(cat /sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-DP-2/status)
# Command to be constructed
run="xrandr --output eDP1 --auto --primary"

# Add DP1 arguments to command
if [ "${dp1_status}" = "connected" ]; then
	run="${run} --output DP1 --auto --above eDP1"
else
	run="${run} --output DP1 --off "
fi

# Add DP2 arguments to command
if [ "${dp2_status}" = "connected" ]; then
	run="${run} --output DP2 --auto --right-of eDP1"
else
	run="${run} --output DP2 --off "
fi

# If we have the dependency jq
if [ -x "$(command -v jq)" ]; then
	# Get current i3 workspace
	C=$(i3-msg -t get_workspaces                \
	  | jq '.[] | select(.focused==true).name'  \
	  | cut -d"\"" -f2)
fi

# Run xrandr to change display setup
echo "Running: ${run}"
${run}

# If we have the dependency jq
if [ -x "$(command -v jq)" ]; then
	# Switch back to the original i3 workspace
	i3-msg "workspace $C"
fi

# Wait to let displays settle and change wallpaper
sleep 3
feh --bg-fill ~/Pictures/Wallpapers/Mountain\ Sunset.jpg
