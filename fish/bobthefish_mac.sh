#!/usr/local/bin/fish

omf install bobthefish
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font

set -U theme_nerd_fonts yes
set -U theme_project_dir_length 1

<<<<<<< HEAD
sh (brew --prefix)/opt/fzf/install
=======
omf install bass
omf install nvm

sh (brew --prefix)/opt/fzf/install
>>>>>>> a78b17cb0cef42a5277fc8b5e6892265b0d7df4a
