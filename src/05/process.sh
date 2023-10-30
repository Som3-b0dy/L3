#!/bin/bash

start=$(date +%s)

folders=$(find $1 -type d 2>/dev/null | wc -l )
echo "Total number of folders (including all nested ones) = $folders"

./top_five_folders.sh "$@"

files=$(find $1 -type f 2>/dev/null | wc -l )
echo "Total number of files = $files"

echo "Number of: "
conf_files=$(find $1 -name "*.conf" 2>/dev/null | wc -l)
echo "Configuration files (with the .conf extension) = $conf_files"

text_files=$(find $1 -name "*.txt" 2>/dev/null |  wc -l)
echo "Text files = $text_files"

exe_files=$(find $1 -type f -executable 2>/dev/null | wc -l)
echo "Executable files = $exe_files"

log_files=$(find $1 -name "*.log" 2>/dev/null |  wc -l)
echo "Log files (with the extension .log) = $log_files"

archive_files=$(find $1 -name "*.tar" -o -name "*.zip" -o -name "*.gz" -o -name "*.bz2" -o -name "*.xz" 2>/dev/null | wc -l)
echo "Archive files = $archive_files"

symbolic_links=$(find $1 -type l 2>/dev/null | wc -l )
echo "Symbolic links = $symbolic_links"

./top_ten_files.sh "$@"

./top_ten_exe_files.sh "$@"

end=$(date +%s)
echo "Script execution time (in seconds) = $(( $end - $start ))"