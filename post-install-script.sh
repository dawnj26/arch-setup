#!/bin/bash

export SETUP_DIR=$(dirname "$0")

source $SETUP_DIR/modules/logger.sh
source $SETUP_DIR/modules/utils.sh

LOG_FILE="$SETUP_DIR/script.log"

cat <<\EOF
   _____ _             _            
  / ____| |           | |           
 | (___ | |_ __ _ _ __| |_ ___ _ __ 
  \___ \| __/ _` | '__| __/ _ \ '__|
  ____) | || (_| | |  | ||  __/ |   
 |_____/ \__\__,_|_|   \__\___|_|   
                                    
                                    
EOF

read -r -p "Do you want to start setup? (y/N): " choice

trap 'error_handler $LINENO' ERR

if [[ $choice == "y" || $choice == "Y" ]]; then
  log_debug "Starting the setup..."

  run_step setup_yay
  run_step update_system 
  run_step install_essentials 
  run_step setup_hyprland

  run_step ./scripts/setup_config.sh
fi
