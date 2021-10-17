#!/usr/bin/env fish

omf install bass
omf install nvm

# Install Fisher
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

# Install nvm
fisher install jorgebucaran/nvm.fish

nvm install latest
set -U nvm_default_version latest