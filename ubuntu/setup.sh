#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

apt update
apt upgrade

apt install software-properties-common

echo "Installing Chrome..."
apt install wget git
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb

bash ~/github/private/dotfiles/git/init.sh

