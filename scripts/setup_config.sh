#!/bin/bash

source $SETUP_DIR/modules/logger.sh

trap 'error_handler $LINENO' ERR

CONFIG_URL="https://github.com/dawnj26/dotfiles"

cd $HOME

log_debug "Cloning config..."
git clone $CONFIG_URL

cd dotfiles

log_debug "Removing hypr generated config..."
rm -rf "$HOME/.config/hypr/"

log_debug "Stowing config files.."
for D in *; do stow $D; done

cp chromium.conf "$HOME/.config/code-flags.conf"

sudo systemctl enable sddm

log_debug "Creating repos dir..."
repos_dir="$HOME/repos"

mkdir -p $repos_dir
cd $repos_dir

log_debug "Installing orchis gtk theme..."
git clone https://github.com/vinceliuice/Orchis-theme.git
cd Orchis-theme || log_error "Failed to clone Orchis-theme."

chmod +x install.sh
./install.sh -c dark -t purple -l

log_success "Installed config files successfully."
