#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
    curl https://raw.githubusercontent.com/nilsstre/dotfiles/master/macOS/setup.sh | bash
elif [ "$(uname)" == "Linux" ]; then
    curl https://raw.githubusercontent.com/nilsstre/dotfiles/master/linux/setup.sh | bash
fi