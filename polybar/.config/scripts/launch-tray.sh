#!/bin/bash

if ! pgrep -x nm-applet; then
	nm-applet &
fi

stalonetray
