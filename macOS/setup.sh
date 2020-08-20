#!/usr/bin/env bash

# Based on https://gist.github.com/bradp/bea76b16d3325f5c47d4

email="nils.streijffert@gmail.com"

# Ask for the administrator password upfront
sudo -v

echo "Installing xcode-stuff"
xcode-select --install

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
echo "Updating Homebrew..."
brew update

echo "Installing Homebrew cask"
brew install caskroom/cask/brew-cask

echo "Installing Chrome..."
brew cask install google-chrome

echo "Installing Git..."
brew install git

echo "Creating an SSH key for you..."
mkdir -p ~/.ssh
cd ~/.ssh
touch github
ssh-keygen -t rsa -b 4096 -C $email
chmod 400 github
ssh-add github

echo "Please add this public key to Github \n"
echo "https://github.com/account/ssh \n"
read -p "Press [Enter] key after this..."

echo "Setting up Git"
bash ~/github/private/dotfiles/macOS/scripts/git.sh

echo "Copying dotfiles from Github"
mkdir -p ~/github/private
cd ~/github/private
git clone git@github.com:nilsstre/dotfiles.git dotfiles

# Run mac setup script
bash ~/github/private/dotfiles/macOS/scripts/mac.sh

# Install applications and packages using Homebrew
bash ~/github/private/dotfiles/macOS/scripts/packages.sh

# Setup Vim
bash ~/github/private/dotfiles/macOS/scripts/vim.sh

# Run fish script
bash ~/github/private/dotfiles/macOS/scripts/fish.sh

echo "Done!"
