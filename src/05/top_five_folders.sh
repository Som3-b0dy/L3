#!/bin/bash

folder_sizes_total=$(du -h --max-depth=50 $1 2>/dev/null | sort -rh)
folder_location_1=$(echo "$folder_sizes_total" | awk 'FNR == 2 {printf $2}')
folder_size_1=$(echo "$folder_sizes_total" | awk 'FNR == 2 {printf $1}')

folder_location_2=$(echo "$folder_sizes_total" | awk 'FNR == 3 {printf $2}')
folder_size_2=$(echo "$folder_sizes_total" | awk 'FNR == 3 {printf $1}')

folder_location_3=$(echo "$folder_sizes_total" | awk 'FNR == 4 {printf $2}')
folder_size_3=$(echo "$folder_sizes_total" | awk 'FNR == 4 {printf $1}')

folder_location_4=$(echo "$folder_sizes_total" | awk 'FNR == 5 {printf $2}')
folder_size_4=$(echo "$folder_sizes_total" | awk 'FNR == 5 {printf $1}')

folder_location_5=$(echo "$folder_sizes_total" | awk 'FNR == 6 {printf $2}')
folder_size_5=$(echo "$folder_sizes_total" | awk 'FNR == 6 {printf $1}')

echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
echo "1 - $folder_location_1, $folder_size_1"
echo "2 - $folder_location_2, $folder_size_2"
echo "3 - $folder_location_3, $folder_size_3"
echo "4 - $folder_location_4, $folder_size_4"
echo "5 - $folder_location_5, $folder_size_5"