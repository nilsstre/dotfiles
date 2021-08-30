#!/usr/bin/env bash

echo "Installing Fish and Oh My Fish"
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

brew install fish
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)
curl -L http://get.oh-my.fish | fish 

fish ~/github/private/dotfiles/fish/bobthefish_mac.sh

ln -isv $script_dir/config.fish ~/.config/fish/config.fish
ln -isv $script_dir/functions ~/.config/fish/functions
