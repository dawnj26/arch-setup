#!/bin/bash

source ./modules/logger.sh
source ./modules/utils.sh

cat <<\EOF
   _____ _             _            
  / ____| |           | |           
 | (___ | |_ __ _ _ __| |_ ___ _ __ 
  \___ \| __/ _` | '__| __/ _ \ '__|
  ____) | || (_| | |  | ||  __/ |   
 |_____/ \__\__,_|_|   \__\___|_|   
                                    
                                    
EOF

log_info "Do you want to start setup? (y/N)"
read -r choice

if [[ $choice == "y" || $choice == "Y" ]]; then
  log_debug "Starting the setup..."

  update-system || exit 1
  setup_yay || exit 1
  install_essentials || exit 1
  setup_hyprland || exit 1

  ./scripts/setup_config.sh
else
  exit 1
fi
