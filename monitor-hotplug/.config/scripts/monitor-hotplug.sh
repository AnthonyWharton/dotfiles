#!/bin/bash

dp1_status=$(cat /sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-DP-1/status)
dp2_status=$(cat /sys/devices/pci0000:00/0000:00:02.0/drm/card0/card0-DP-2/status)
run="xrandr --output eDP1 --auto"

if [ "${dp1_status}" = "connected" ]; then
	run="${run} --output DP1 --auto --above eDP1"
else
	run="${run} --output DP1 --off "
fi

if [ "${dp2_status}" = "connected" ]; then
	run="${run} --output DP2 --auto --right-of eDP1"
else
	run="${run} --output DP2 --off "
fi

echo "Running: ${run}"
${run}

