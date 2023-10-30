#!/bin/bash

source ./color.conf

if [ -z "$column1_background" ]; then
    column1_background=6
fi
if [ -z "$column1_font_color" ]; then
    column1_font_color=2
fi
if [ -z "$column2_background" ]; then
    column2_background=5
fi
if [ -z "$column2_font_color" ]; then
    column2_font_color=1
fi

if [ "$column1_background" -eq "$column1_font_color" ] || [ "$column2_background" -eq "$column2_font_color" ];then
    echo "Incorrect values"
    exit 1
fi

font_colors=("\e[0m" "\e[37m" "\e[31m" "\e[32m" "\e[34m" "\e[35m" "\e[30m")
background_colors=("\e[0m" "\e[47m" "\e[41m" "\e[42m" "\e[44m" "\e[45m" "\e[40m")
first_column=${background_colors["$column1_background"]}${font_colors["$column1_font_color"]}
second_column=${background_colors["$column2_background"]}${font_colors["$column2_font_color"]}
reset_color=${background_colors[0]}${font_colors[0]}

source process.sh
