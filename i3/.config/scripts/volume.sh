#!/bin/bash
# Changes the system's volume level to the next 5% increment.
# Not the most general implementation, for use with my personal i3 config.

# Get's the default sink information only
SINK=$(pacmd list-sinks | awk '/* index/{print;flag=1;next}/index/{flag=0}flag')
SINK_ID=$(echo "$SINK" | grep "* index:"                 | sed -E -e 's/^[^0-9]*([0-9]*).*$/\1/')
VOL_MAX=$(echo "$SINK" | grep "^[[:space:]]base volume:" | sed -E -e 's/^[^0-9]*([0-9]*).*$/\1/')
VOL_CUR=$(echo "$SINK" | grep "^[[:space:]]volume:"      | sed -E -e 's/^[^0-9]*([0-9]*).*$/\1/')
IS_MUTE=$(echo "$SINK" | grep "^[[:space:]]muted:"       | sed -E -e 's/.*(yes|no).*/\1/')
VOL_STP=$((VOL_MAX / 20 + 1))

# Finds the higher and lower values for 5% volume increments around the current
# volume. This is used so the volume_up and volume_down functions can always
# align the volume to 5% increments perfectly, regardless on the current volume.
I_L=0
I_H=$VOL_STP
while [[ ! $I_L -le $VOL_CUR || ! $VOL_CUR -lt $I_H ]]; do
    I_L=$((I_L + VOL_STP))
    I_H=$((I_H + VOL_STP))
done

# Increases the volume to the next 5% volume increment
function volume_up {
    if [[ $VOL_CUR -lt $VOL_MAX ]]; then
        if [[ "$IS_MUTE" = "yes" ]]; then
            toggle_mute
        fi
	pactl set-sink-volume $SINK_ID +$((I_H - VOL_CUR))
    fi
}

# Decreases the volume to the next 5% volume increment
function volume_down {
    if [[ $VOL_CUR -gt 0 ]]; then
        if [[ "$IS_MUTE" = "yes" ]]; then
            toggle_mute
        fi
        if [[ $VOL_CUR -eq $I_L ]]; then
            pactl set-sink-volume $SINK_ID -$VOL_STP
	else
            pactl set-sink-volume $SINK_ID -$((VOL_CUR - I_L))
	fi
    fi
}

function toggle_mute {
    pactl set-sink-mute $SINK_ID toggle
}

function print_help {
    echo "Usage: ./volume.sh [-u|-d|-t|-h]"
    echo "Changes the system volume level."
    echo "Available Arguments:"
    echo "    -u | --up       Raises the system volume by 5%"
    echo "    -d | --down     Lowers the system volume by 5%"
    echo "    -t | --toggle   Toggles system muted status on/off."
    echo "    -h | --help     Prints this help dialogue and exits."
}

if [[ $# -eq 0 ]]; then
    print_help
    echo "No arguments given. Exiting.."
    exit 0
fi

while test $# -gt 0; do
    case "$1" in
   	    -h|--help)
		    print_help
		    exit 0
    	    ;;
   		-u|--up)
    		volume_up
    		exit 0
        	;;
   		-d|--down)
    		volume_down
    		exit 0
    	    ;;
   		-t|--toggle)
    		toggle_mute
    		exit 0
        	;;
   		*)
            print_help
  		    echo "Unknown argument: $1"
            exit 1
  		    ;;
    esac
done

