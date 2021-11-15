#!/usr/local/bin/fish

omf install bobthefish
omf install bass
omf install nvm

set -U theme_nerd_fonts yes
set -U theme_project_dir_length 1

sh (brew --prefix)/opt/fzf/install
