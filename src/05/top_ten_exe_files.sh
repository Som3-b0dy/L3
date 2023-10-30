#!/bin/bash

top_10_exe_files=$(find $1 -type f -executable -exec du -ch {} + 2>/dev/null | grep -v "/total$" | sort -rn | head -n 10)
top_1_exe_file_size=$(echo "$top_10_exe_files" | awk 'FNR == 1 {printf $1}')
top_1_exe_file_name=$(echo "$top_10_exe_files" | awk 'FNR == 1 {printf $2}')
top_1_exe_file_hash=$(echo "$top_1_exe_file_name" | md5sum | awk '{printf $1}')

top_2_exe_file_size=$(echo "$top_10_exe_files" | awk 'FNR == 2 {printf $1}')
top_2_exe_file_name=$(echo "$top_10_exe_files" | awk 'FNR == 2 {printf $2}')
top_2_exe_file_hash=$(echo "$top_2_exe_file_name" | md5sum | awk '{printf $1}')

top_3_exe_file_size=$(echo "$top_10_exe_files" | awk 'FNR == 3 {printf $1}')
top_3_exe_file_name=$(echo "$top_10_exe_files" | awk 'FNR == 3 {printf $2}')
top_3_exe_file_hash=$(echo "$top_2_exe_file_name" | md5sum | awk '{printf $1}')

top_4_exe_file_size=$(echo "$top_10_exe_files" | awk 'FNR == 4 {printf $1}')
top_4_exe_file_name=$(echo "$top_10_exe_files" | awk 'FNR == 4 {printf $2}')
top_4_exe_file_hash=$(echo "$top_2_exe_file_name" | md5sum | awk '{printf $1}')

top_5_exe_file_size=$(echo "$top_10_exe_files" | awk 'FNR == 5 {printf $1}')
top_5_exe_file_name=$(echo "$top_10_exe_files" | awk 'FNR == 5 {printf $2}')
top_5_exe_file_hash=$(echo "$top_2_exe_file_name" | md5sum | awk '{printf $1}')

top_6_exe_file_size=$(echo "$top_10_exe_files" | awk 'FNR == 6 {printf $1}')
top_6_exe_file_name=$(echo "$top_10_exe_files" | awk 'FNR == 6 {printf $2}')
top_6_exe_file_hash=$(echo "$top_2_exe_file_name" | md5sum | awk '{printf $1}')

top_7_exe_file_size=$(echo "$top_10_exe_files" | awk 'FNR == 7 {printf $1}')
top_7_exe_file_name=$(echo "$top_10_exe_files" | awk 'FNR == 7 {printf $2}')
top_7_exe_file_hash=$(echo "$top_2_exe_file_name" | md5sum | awk '{printf $1}')

top_8_exe_file_size=$(echo "$top_10_exe_files" | awk 'FNR == 8 {printf $1}')
top_8_exe_file_name=$(echo "$top_10_exe_files" | awk 'FNR == 8 {printf $2}')
top_8_exe_file_hash=$(echo "$top_2_exe_file_name" | md5sum | awk '{printf $1}')

top_9_exe_file_size=$(echo "$top_10_exe_files" | awk 'FNR == 9 {printf $1}')
top_9_exe_file_name=$(echo "$top_10_exe_files" | awk 'FNR == 9 {printf $2}')
top_9_exe_file_hash=$(echo "$top_2_exe_file_name" | md5sum | awk '{printf $1}')

top_10_exe_file_size=$(echo "$top_10_exe_files" | awk 'FNR == 10 {printf $1}')
top_10_exe_file_name=$(echo "$top_10_exe_files" | awk 'FNR == 10 {printf $2}')
top_10_exe_file_hash=$(echo "$top_2_exe_file_name" | md5sum | awk '{printf $1}')

echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"
echo "1 - $top_1_exe_file_name, $top_1_exe_file_size, $top_1_exe_file_hash"
echo "2 - $top_2_exe_file_name, $top_2_exe_file_size, $top_2_exe_file_hash"
echo "3 - $top_3_exe_file_name, $top_3_exe_file_size, $top_3_exe_file_hash"
echo "4 - $top_4_exe_file_name, $top_4_exe_file_size, $top_4_exe_file_hash"
echo "5 - $top_5_exe_file_name, $top_5_exe_file_size, $top_5_exe_file_hash"
echo "6 - $top_6_exe_file_name, $top_6_exe_file_size, $top_6_exe_file_hash"
echo "7 - $top_7_exe_file_name, $top_7_exe_file_size, $top_7_exe_file_hash"
echo "8 - $top_8_exe_file_name, $top_8_exe_file_size, $top_8_exe_file_hash"
echo "9 - $top_9_exe_file_name, $top_9_exe_file_size, $top_9_exe_file_hash"
echo "10 - $top_10_exe_file_name, $top_10_exe_file_size, $top_10_exe_file_hash"