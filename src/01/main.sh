#!/bin/bash

function check_params {
    if [ "$#" -lt 1 ] || [ "$#" -gt 1 ]; then
        echo "Incorrect amount of system arguments passed"
        exit 1
    else
        if [[ ${!#} =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
            echo "Entered value is a number"
            exit 2
        else
            echo "$1"
        fi
    fi
}

check_params "$@"