#!/usr/local/bin/fish

omf install bobthefish
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v1.0.0/FiraCode.zip
sudo unzip FiraCode.zip -d /usr/local/share/fonts/
sudo fc-cache -fv
set -U theme_nerd_fonts yes