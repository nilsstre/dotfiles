#!/usr/bin/env bash

# Based on https://gist.github.com/bradp/bea76b16d3325f5c47d4

echo "Started MacOS setup script"

email="nils.streijffert@gmail.com"

echo "Installing xcode-stuff"
sudo xcode-select --install

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
brew install cask

echo "Installing Git..."
brew install git

echo "Creating an SSH key for you..."
mkdir -p ~/.ssh
github=~/.ssh/github
ssh-keygen -t rsa -b 4096 -C $email -f $github -P "" # Set empty password
chmod 400 $github
ssh-add $github
cat $github.pub

echo "Please add this public key to Github \n"
echo "https://github.com/account/ssh \n"
read -p "Press [Enter] key after this..."

echo "Pulling dotfiles from Github"
githubDir=~/github/private
mkdir -p $githubDir
git clone git@github.com:nilsstre/dotfiles.git $githubDir/dotfiles

sudo -v # set sudo privileges

dotfiles=$githubDir/dotfiles

# Run mac setup script
bash $dotfiles/macOS/scripts/mac.sh || echo "Error while running the mac.sh script"

# Install applications and packages using Homebrew
bash $dotfiles/macOS/scripts/packages.sh || echo "Error while running the packages.sh script"

# Setup Vim
bash $dotfiles/vim/setup.sh || echo "Error while running the vim setup script"

# Setup Git
bash $dotfiles/git/setup.sh || echo "Error while running the git setup script"

# Run fish script
bash $dotfiles/fish/setup_mac.sh || echo "Error while running the fish_mac setup script"

# Setup nvm
fish $dotfiles/nvm/setup.sh || echo "Error while running the vim setup script"

# Setup private values
bash $dotfiles/private/setup.sh || echo "Error while setting up private dotfiles"

echo "Done!"
