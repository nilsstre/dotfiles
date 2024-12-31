#!/usr/bin/env bash

set -xe

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

mkdir -p ~/.config/zhs

ln -s "$SCRIPT_DIR/zshrc.zhs" ~/.zshrc
ln -s "$SCRIPT_DIR/aliases.zhs" ~/.config/zhs/aliases.zhs
