#!/bin/bash

killall -9 stalonetray
killall -9 trayer

if ! pgrep -x nm-applet; then
	nm-applet &
fi

trayer                      \
	--edge top          \
	--align right       \
	--distancefrom top  \
	--distance 4        \
	--margin 4          \
	--iconspacing 4     \
	--widthtype pixel   \
	--width 80          \
	--heighttype pixel  \
	--height 24         \
	--SetDockType false \
	--transparent true  \
	--tint 0xbb222222   \
	--alpha 68          \
	--expand false      \
	--monitor primary &
