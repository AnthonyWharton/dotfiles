#!/bin/bash

# Terminate already running bar instances
killall -9 polybar
killall -9 stalonetray
killall -9 trayer
killall -9 nm-applet

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar main &

