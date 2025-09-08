#!/usr/bin/env bash

set -e

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

mkdir -p "$ZSH_CUSTOM"
mkdir -p "$ZSH_CUSTOM/functions"

ln -fsv "$SCRIPT_DIR/zshrc.zsh" ~/.zshrc

ln -fsv "$SCRIPT_DIR/aliases.zsh" "$ZSH_CUSTOM/aliases.zsh"

for filename in "$SCRIPT_DIR"/functions/*.zsh; do
  temp=$(basename "$filename")
  base_filename="${temp%%.*}"

  ln -fsv "$filename" "$ZSH_CUSTOM/functions/$base_filename"
done

if ! [ -d "${ZSH_CUSTOM}/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM}/themes/powerlevel10k"
fi
