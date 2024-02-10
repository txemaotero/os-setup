#!/bin/bash

initial_path=$(pwd)
script_dir=$(dirname "$(realpath "$0")")

cd $script_dir/../dotfiles/

stow -v -R -t ${HOME} .

cd $initial_path
