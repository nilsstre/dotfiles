#!/usr/bin/env bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# symlink stuff
ln -isv $script_dir/gitconfig ~/.gitconfig
ln -isv $script_dir/gitignore ~/.gitignore