#!/bin/bash

# Terminate already running bar instances
kill -9 $(pgrep -x polybar)
kill -9 $(pgrep -x stalonetray)

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar main & disown

