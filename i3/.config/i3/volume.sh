#!/bin/bash
# Changes the system's volume level.
# Not the most general implementation, for use with my i3 config.

VOLUME=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
MUTE=$(pactl list sinks | grep '^[[:space:]]Mute:' | sed -e 's/.*\(yes\|no\).*/\1/')

function volume_up {
    if [[ $VOLUME -lt 100 ]]; then
        if [[ "$MUTE" = "yes" ]]; then
            toggle_mute
        fi
        pactl set-sink-volume 0 +3277        
    fi
}

function volume_down {
    if [[ $VOLUME -gt 0 ]]; then 
        if [[ "$MUTE" = "yes" ]]; then
            toggle_mute
        fi
        pactl set-sink-volume 0 -3277
    fi
}

function toggle_mute {
    pactl set-sink-mute 0 toggle
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

