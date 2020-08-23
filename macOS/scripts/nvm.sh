#!/usr/bin/env bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

ln -isv ~/github/private/dotfiles/nvm/ ~/.nvm/

# Install lastest version of node
nvm install node
