# Some X settings
xset s off
xset -dpms
xset s noblank

# Please don't go mad on hidpi laptop.. you can do it I believe in you
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
xrandr --dpi 196
export GDK_SCALE=2
gsettings set org.gnome.desktop.interface scaling-factor 2
export BROWSER=/usr/bin/chromium

# Check dbus is running and check envrionment variables are all good
# This should fix most of gnome/gtk based scaling with the above as well!
eval `dbus-launch --sh-syntax`
dbus-update-activation-environment --all

# Also sort out the keyboard to be GB in hope that this will fix Synergy being
# bad at life
setxkbmap gb

# Finally we're done, launch i3
i3
