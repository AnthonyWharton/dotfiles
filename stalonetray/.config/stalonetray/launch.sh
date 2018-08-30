#!/bin/bash

# Terminate already running bar instances
killall -q stalonetray

# Wait until the processes have been shut down
while pgrep -x stalonetray >/dev/null; do sleep 1; done

# Launch polybar
stalonetray & disown
