#!/usr/bin/env bash

STOW_FOLDERS='nvim fish vimrc'

for folder in $STOW_FOLDERS; do
    echo "Installing $folder"
    stow -v -R -t $HOME $folder
done
