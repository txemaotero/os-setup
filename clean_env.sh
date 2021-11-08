#!/usr/bin/env bash

STOW_FOLDERS='nvim fish vimrc'

for folder in $STOW_FOLDERS; do
    echo "Removing $folder"
    stow -v -D -t $HOME $folder
done

