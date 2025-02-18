#!/usr/bin/env bash

## Script To Save Themes

## Theme ------------------------------------
CDIR="$HOME/.config"
TDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
THEME="${TDIR##*/}"

# Ask the user for a folder name
read -p "Enter the destination folder name: " DEST_FOLDER

# If the user enters nothing, exit
if [[ -z "$DEST_FOLDER" ]]; then
    echo "No folder name provided. Exiting."
    exit 1
fi

cp -r "$TDIR"/  "$CDIR"/themes/"$DEST_FOLDER"/
cp "$HOME/.cache/wal/colors.sh" "$CDIR"/themes/"$DEST_FOLDER"/
