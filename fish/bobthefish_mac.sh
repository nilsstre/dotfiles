#!/usr/local/bin/fish

omf install bobthefish
brew tap homebrew/cask-fonts
brewinstall --cask font-fira-code-nerd-font

set -U theme_nerd_fonts yes
set -U theme_project_dir_length 1

omf install bass
omf install nvm

sh (brew --prefix)/opt/fzf/install
