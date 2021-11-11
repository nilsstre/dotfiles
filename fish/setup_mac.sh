#!/usr/bin/env bash

echo "Installing Oh My Fish"
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)
curl -L http://get.oh-my.fish | fish 

fish ~/github/private/dotfiles/fish/bobthefish_mac.sh

ln -isv $script_dir/config.fish ~/.config/fish/config.fish

bash $script_dir/link_functions.sh
