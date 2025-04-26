#!/bin/bash

trap 'error_handler $LINENO' ERR

cd $HOME

cd dotfiles

rm -rf "$HOME/.config/hypr/"

for D in *; do stow $D; done

cp chromium.conf "$HOME/.config/code-flags.conf"

sudo systemctl enable sddm

repos_dir="$HOME/repos"

mkdir -p $repos_dir
cd $repos_dir

git clone https://github.com/vinceliuice/Orchis-theme.git
cd Orchis-theme || log_error "Failed to clone Orchis-theme."

chmod +x install.sh
./install.sh -c dark -t purple -l

