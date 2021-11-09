#!/usr/bin/env bash

STOW_FOLDERS='nvim fish vimrc tmux'

for folder in $STOW_FOLDERS; do
    echo "Installing $folder"
    stow -v -R -t $HOME $folder
done
