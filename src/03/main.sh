#!/bin/bash

font_colors=("\e[0m" "\e[37m" "\e[31m" "\e[32m" "\e[34m" "\e[35m" "\e[30m")
background_colors=("\e[0m" "\e[47m" "\e[41m" "\e[42m" "\e[44m" "\e[45m" "\e[40m")
first_column=${background_colors["$1"]}${font_colors["$2"]}
second_column=${background_colors["$3"]}${font_colors["$4"]}
reset_color=${background_colors[0]}${font_colors[0]}

export font_colors
export background_colors
export first_column
export second_column
export reset_color

if [ "$#" -lt 4 ] || [ "$#" -gt 4 ];then
    echo "Incorrect amount of system arguments passed"
    exit 1
else
    for arg in "$@"; do
        if ! [[ $arg =~ ^[1-6]$ ]];then
            echo "Invalid input"
            exit 2
        elif [ "$1" = "$2" ] || [ "$3" = "$4" ];then
            echo "Please, enter different values for same column"
            read -rp "Do you want to execute script again? y/n "
            if [ "$REPLY" = y ];then
                read -rp "Enter four arguments " one two three four
                set -- "$one" "$two" "$three" "$four"
                exec "$0" "$@"
            else
                exit 0
            fi
        fi
    done
    ./process.sh "$@"
fi