#!/bin/bash

top_10_files=$(find $1 -type f -exec du -ch {} + 2>/dev/null | grep -v "/total$" | sort -rn | head -n 10)
top_1_file_size=$(echo "$top_10_files" | awk 'FNR == 1 {printf $1}')
top_1_file_name=$(echo "$top_10_files" | awk 'FNR == 1 {printf $2}')
top_1_file_ext="${top_1_file_name##*.}"

top_2_file_size=$(echo "$top_10_files" | awk 'FNR == 2 {printf $1}')
top_2_file_name=$(echo "$top_10_files" | awk 'FNR == 2 {printf $2}')
top_2_file_ext="${top_2_file_name##*.}"

top_3_file_size=$(echo "$top_10_files" | awk 'FNR == 3 {printf $1}')
top_3_file_name=$(echo "$top_10_files" | awk 'FNR == 3 {printf $2}')
top_3_file_ext="${top_3_file_name##*.}"

top_4_file_size=$(echo "$top_10_files" | awk 'FNR == 4 {printf $1}')
top_4_file_name=$(echo "$top_10_files" | awk 'FNR == 4 {printf $2}')
top_4_file_ext="${top_4_file_name##*.}"

top_5_file_size=$(echo "$top_10_files" | awk 'FNR == 5 {printf $1}')
top_5_file_name=$(echo "$top_10_files" | awk 'FNR == 5 {printf $2}')
top_5_file_ext="${top_5_file_name##*.}"

top_6_file_size=$(echo "$top_10_files" | awk 'FNR == 6 {printf $1}')
top_6_file_name=$(echo "$top_10_files" | awk 'FNR == 6 {printf $2}')
top_6_file_ext="${top_6_file_name##*.}"

top_7_file_size=$(echo "$top_10_files" | awk 'FNR == 7 {printf $1}')
top_7_file_name=$(echo "$top_10_files" | awk 'FNR == 7 {printf $2}')
top_7_file_ext="${top_7_file_name##*.}"

top_8_file_size=$(echo "$top_10_files" | awk 'FNR == 8 {printf $1}')
top_8_file_name=$(echo "$top_10_files" | awk 'FNR == 8 {printf $2}')
top_8_file_ext="${top_8_file_name##*.}"

top_9_file_size=$(echo "$top_10_files" | awk 'FNR == 9 {printf $1}')
top_9_file_name=$(echo "$top_10_files" | awk 'FNR == 9 {printf $2}')
top_9_file_ext="${top_9_file_name##*.}"

top_10_file_size=$(echo "$top_10_files" | awk 'FNR == 10 {printf $1}')
top_10_file_name=$(echo "$top_10_files" | awk 'FNR == 10 {printf $2}')
top_10_file_ext="${top_10_file_name##*.}"


echo "TOP 10 files of maximum size arranged in descending order (path, size and type): "
echo "1 - $top_1_file_name, $top_1_file_size, $top_1_file_ext"
echo "2 - $top_2_file_name, $top_2_file_size, $top_2_file_ext"
echo "3 - $top_3_file_name, $top_3_file_size, $top_3_file_ext"
echo "4 - $top_4_file_name, $top_4_file_size, $top_4_file_ext"
echo "5 - $top_5_file_name, $top_5_file_size, $top_5_file_ext"
echo "6 - $top_6_file_name, $top_6_file_size, $top_6_file_ext"
echo "7 - $top_7_file_name, $top_7_file_size, $top_7_file_ext"
echo "8 - $top_8_file_name, $top_8_file_size, $top_8_file_ext"
echo "9 - $top_9_file_name, $top_9_file_size, $top_9_file_ext"
echo "10 - $top_10_file_name, $top_10_file_size, $top_10_file_ext"