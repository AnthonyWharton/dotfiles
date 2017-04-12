#!/bin/bash
# Installs all dotfiles using GNU Stow
# Thanks to https://github.com/fj2 for some inspiration.

function install {
    programs=( `ls -d1 */` )
    numprogs=${#programs[*]}
    x=1
    for program in ${programs[@]} 
    do
        echo -e " [$x/$numprogs] Restoring.. ${program::-1}"
        stow $program
        x=$((x + 1))
    done
}

function print_help {
    echo "Usage: ./install.sh [-h]"
    echo "Installs all dotfiles using GNU Stow."
    echo "Available Arguments:"
    echo "    -h | --help     Prints this help dialogue and exits."
}
 
if [[ $# -eq 0 ]]; then
    install
	exit 0
fi

while test $# -gt 0; do
    case "$1" in
        -h|--help)
            print_help
            exit 0
            ;;
        *)
            print_help
            echo "Unknown argument: $1"
            exit 1
            ;;
    esac
done

