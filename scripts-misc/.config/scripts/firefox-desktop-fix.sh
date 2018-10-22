#!/bin/bash
# Quick and dirty script to patch the firefox desktop file to always use a
# white GTK theme as to not break website appearances. Does a crude check to
# ensure that it doesn't apply the patch twice.

if [[ "$EUID" -ne 0 ]]; then 
	echo "This fix requires root, please allow for root privileges."
	echo "Gaining root privilege for file fix.. "
	gksu $0 &> /dev/null
	exit $?
fi

grep -Fq "bash" /usr/share/applications/firefox.desktop
if [[ $? -ne 0 ]]; then
	echo "Applying fix"
	sed -i "s/\(Exec=\)\(.*\)/\1bash -c \'GTK_THEME=Adwaita\:light \2\'/" \
		/usr/share/applications/firefox.desktop
else
	echo "Not applied fix - seems to already be there!"
fi
