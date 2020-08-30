#!/usr/bin/env bash

apt-add-repository ppa:fish-shell/release-3
apt update
apt upgrade

yes | apt install fish

chsh -s /usr/bin/fish
curl -L http://get.oh-my.fish | fish

fish ./fish/bobthefish_linux.sh

ln -isv ./fish/config.fish ~/.config/fish/config.fish
ln -isv ./fish/functions ~/.config/fish/functions

