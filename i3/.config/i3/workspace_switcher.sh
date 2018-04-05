#!/bin/bash
# Quick and dirty way to swap two workspaces in the i3 window manager.
# Ensures you have depndencies, but error handle very well.
#
# Usage:
#   ./workspace_switcher [--stay] WORKSPACE_NAME
#
# Effect:
#   Switches all the windows on the current workspace with that from
#   WORKSPACE_NAME whilst preserving window layout.
#   Defualt behaviour is to stay on the current workspace with the new windows
#   after switching. However, if `--stay` is specified then you will stay with
#   the current (now moved) workspace. 

# Check for dependencies
if ! [ -x "$(command -v jq)" ]; then
	notify-send --urgency=critical "Unable to swap workspace!" 
	                               "You must have 'jq' installed."
	exit 1
fi

# Get current workspace
C=$(i3-msg -t get_workspaces                \
  | jq '.[] | select(.focused==true).name'  \
  | cut -d"\"" -f2)

# Small sanity check
if [ ${@:-1} == $C ]; then
	echo "You can't switch with the current workspace!"
	exit 1
fi

# Switch the workspaces
i3-msg "rename workspace $C to temp;
        rename workspace ${@:-1} to $C;
        rename workspace temp to ${@:-1}"

# Check for --stay
for arg in "$@"
do
	if [ arg == "--stay" ]; then
		exit 0
	fi
done

# Switch back to the original workspace
i3-msg "workspace $C"

