#!/bin/bash

source ./color.conf

verbal_color=("default" "white" "red" "green" "blue" "purple" "black")

if [ -z "$column1_background" ]; then
    echo "Column 1 background = ${verbal_color[0]} (${verbal_color[6]})"
else
    echo "Column 1 background = $1 (${verbal_color[$1]})"
fi

if [ -z "$column1_font_color" ]; then
    echo "Column 1 font color = ${verbal_color[0]} (${verbal_color[2]})"
else
    echo "Column 1 font color = $2 (${verbal_color[$2]})"
fi

if [ -z "$column2_background" ]; then
    echo "Column 2 background = ${verbal_color[0]} (${verbal_color[5]})"
else
    echo "Column 2 background = $3 (${verbal_color[$3]})"
fi

if [ -z "$column2_font_color" ]; then
    echo "Column 2 font color = ${verbal_color[0]} (${verbal_color[1]})"
else
    echo "Column 2 font color = $4 (${verbal_color[$4]})"
fi

