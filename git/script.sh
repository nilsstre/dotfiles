#!/usr/bin/env bash

set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

ln -fsv "$SCRIPT_DIR/gitconfig" ~/.gitconfig
ln -fsv "$SCRIPT_DIR/gitconfig-private" ~/.gitconfig-private

ln -fsv "$SCRIPT_DIR/gitignore-global" ~/.gitignore
