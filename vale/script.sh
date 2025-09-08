#!/usr/bin/env bash

set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

DEST_FOLDER="$XDG_CONFIG_HOME/vale"

ln -fvs "$SCRIPT_DIR/vale.ini" "$DEST_FOLDER/.vale.ini"
ln -fvs "$SCRIPT_DIR/config" "$DEST_FOLDER/config"
