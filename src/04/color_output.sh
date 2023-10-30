#!/bin/bash

verbal_color=("default" "white" "red" "green" "blue" "purple" "black")
echo "Column 1 background = $1 (${verbal_color[$column1_background]})"
echo "Column 1 font color = $2 (${verbal_color[$column1_font_color]})"
echo "Column 2 background = $3 (${verbal_color[$column2_background]})"
echo "Column 2 font color = $4 (${verbal_color[$column2_font_color]})"
