#!/usr/bin/env bash

echo "Installing Fish and Oh My Fish"
brew install fish
echo $(which fish) | sudo tee -a /etc/shells
chsh -s (which fish)
curl -L http://get.oh-my.fish | fish

fish ~/github/private/dotfiles/fish/bobthefish_mac.sh

ln -isv ~/github/private/dotfiles/fish/config.fish ~/.config/fish/config.fish
ln -isv ~/github/private/dotfiles/fish/functions ~/.config/fish/functions

cd ~/github/private/
git clone git@github.com:nilsstre/dotfilesPrivate.git
fish ~/dotfilesPrivate/setup.sh
