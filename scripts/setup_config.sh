#!/bin/bash

source ../modules/logger.sh

config_url="https://github.com/dawnj26/dotfiles"

cd $HOME || log_error "Failed to go at HOME directory." && exit 1

git clone $config_url || log_error "Failed to clone config." && exit 1
cd dotfiles

rm -rf "$HOME/.config/hypr/"
for D in *; do stow $D; done

cp chromium.conf "$HOME/.config/code-flags.conf"

sudo systemctl enable sddm
cp -r wallpapers/ "$HOME/Pictures/wallpapers"

repos_dir="$HOME/repos"

mkdir -p $repos_dir
cd $repos_dir || log_error "Failed to create repo directory." && exit 1

git clone https://github.com/vinceliuice/Orchis-theme.git
cd Orchis-theme || log_error "Failed to clone Orchis-theme." && exit 1

chmod +x install.sh
./install.sh -c dark -t purple -l
