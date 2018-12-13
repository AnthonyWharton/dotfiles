#!/bin/bash

rofi -modi drun,ssh \
	-show drun \
	-ssh-command "WINIT_HIDPI_FACTOR=1.0 alacritty" \
	-lines 7 \
	-color-enabled \
	-color-window "#2f343f, #002b36, #000000" \
	-color-normal "#2f343f, #5d6371, #2c313c, #7fb800, #f3f4f5" \
	-opacity "100" \
	-bw 0 \
	-font "SauceCodePro Nerd Font 16"
