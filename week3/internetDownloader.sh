#!/bin/bash

while :; do
    read -p "Type in a URL you wish to download, or \"exit\" to quit out of the program: " userInput

    case "$userInput" in
    exit|EXIT|quit|QUIT)  echo "Compleated!"
        exit 0
        ;;
    esac

    read -p "Target location for the download: " targetLocation
    targetLocation=$(eval echo "$targetLocation")

    if ! cd "$targetLocation"; then
        echo "The download location is invalid"
        continue
    fi

    if wget "$userInput"; then
        echo "Download successful"
    else
        echo "Download failed"
    fi
done
