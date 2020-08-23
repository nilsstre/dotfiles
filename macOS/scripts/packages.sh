#!/usr/bin/env bash

packages=(
    tree
    wget 
    trash
    htop-osx
    tmux
    neovim
    thefuck
    fzf
)

echo "Installing Homebrew packages..."
brew install ${packages[@]}

# Apps
apps=(
  alfred
  spotify
  iterm2
  sublime-text
  deluge
  vlc
  slack
  google-photos-backup-and-sync
  visual-studio-code
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "Installing apps with Cask..."
brew cask install --appdir="/Applications" ${apps[@]}

echo "Linkg alfred with Homebrew"
brew cask alfred link

brew cask cleanup
brew cleanup

echo "Downloading OVPN-client"
cd ~/Downloads
curl -L -O https://files.ovpn.com/client/latest/OVPN.zip
unzip OVPN.zip
rm -rf OVPN.zip
mv OVPN.app /Applications/
