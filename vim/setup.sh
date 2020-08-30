#!/usr/bin/env bash

mkdir -p ~/.vim ~/.nvim ~/.config/nvim

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -isv ./vim/vimrc ~/.vim/vimrc
ln -isv ./vim/init.vim ~/.config/nvim/init.vim

# install plugins
nvim -c ':PlugInstall' -c 'qa!'
