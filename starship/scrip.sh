#!/usr/bin/env bash

set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

DEST_FOLDER="$XDG_CONFIG_HOME/starship"

mkdir -p "$DEST_FOLDER"

ln -fvs "$SCRIPT_DIR/config.toml" "$DEST_FOLDER/config.toml"
