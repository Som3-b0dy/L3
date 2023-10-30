#!/bin/bash

time=$(date +"%d_%m_%y_%H_%M_%S")
read -r -p "Do you need to save this data into file, y/n? "
    if [ "$REPLY" = y ] || [ "$REPLY" = Y ]; then
        ./main.sh > "$time".txt
    else
        exit 0
    fi