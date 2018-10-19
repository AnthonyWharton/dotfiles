# Some X settings
xset s off
xset -dpms
xset s noblank

# Please don't go mad on hidpi laptop.. you can do it I believe in you
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Rest in peace XPS 13 9350, wherever you may be :'(
# xrandr --dpi 165
# export GDK_SCALE=2
# export GDK_DPI_SCALE=0.5
# gsettings set org.gnome.desktop.interface scaling-factor 2

export QT_QPA_PLATFORMTHEME='gtk2'

# Check dbus is running and check envrionment variables are all good
# This should fix most of gnome/gtk based scaling with the above as well!
eval `dbus-launch --sh-syntax`
dbus-update-activation-environment --all

# Load environment variabled into system d user mode
/etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# Finally we're done, launch i3
i3
