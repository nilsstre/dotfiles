#!/usr/bin/env bash

echo "Installing Fish and Oh My Fish"
brew install fish
fish
echo (which fish) | sudo tee -a /etc/shells
chsh -s (which fish)
curl -L http://get.oh-my.fish | fish
omf install bobthefish
brew tap caskroom/fonts
brew cask install font-firacode-nerd-font
set -U theme_nerd_fonts yes

ln -isv ~/github/private/dotfiles/fish/config.fish ~/.config/fish/config.fish
ln -isv ~/github/private/dotfiles/fish/functions ~/.config/fish/functions

# Install fzf extras
sh (brew --prefix)/opt/fzf/install