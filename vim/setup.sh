#!/usr/bin/env bash

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

mkdir -p ~/.vim ~/.nvim ~/.config/nvim

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -isv $script_dir/vimrc ~/.vim/vimrc
ln -isv $script_dir/init.vim ~/.config/nvim/init.vim

# install plugins
nvim -c ':PlugInstall' -c 'qa!'
