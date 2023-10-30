#!/bin/bash
if [ "$#" -ne 1 ] || ! [[ ${!#} =~ /$ ]];then
    echo "Incorrect argument passed"
    exit 1
else
    ./process.sh "$@"
fi
