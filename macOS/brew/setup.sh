#!/usr/bin/env bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

ln -isv $script_dir/Brewfile ~/Brewfile

brew bundle

brew cleanup
