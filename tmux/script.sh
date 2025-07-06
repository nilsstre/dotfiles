#!/usr/bin/env bash

set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

DEST_FOLDER="$XDG_CONFIG_HOME/tmux"

mkdir -p "$DEST_FOLDER"

ln -fvs "$SCRIPT_DIR/tmux.conf" "$DEST_FOLDER/tmux.conf"
