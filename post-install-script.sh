#!/bin/bash

export SETUP_DIR=$(dirname "$0")

source "$SETUP_DIR/modules/logger.sh"
source "$SETUP_DIR/modules/utils.sh"

LOG_FILE="$SETUP_DIR/script.log"

cat <<\EOF
   _____ _             _            
  / ____| |           | |           
 | (___ | |_ __ _ _ __| |_ ___ _ __ 
  \___ \| __/ _` | '__| __/ _ \ '__|
  ____) | || (_| | |  | ||  __/ |   
 |_____/ \__\__,_|_|   \__\___|_|   
                                    
                                    
EOF

# Define available steps
declare -a steps=(
    "setup_yay"
    "update_system"
    "install_essentials"
    "setup_hyprland"
    "./scripts/setup_config.sh"
)

# Function to display the menu
display_menu() {
    log_info "Available setup steps:"
    for i in "${!steps[@]}"; do
        printf "%d) %s\n" $((i+1)) "${steps[$i]}"
    done
    printf "0) Exit\n"
    echo "-------------------------"
}

# Main loop
main() {
    trap 'error_handler $LINENO' ERR

    while true; do
        display_menu
        read -r -p "Choose a step number (or 0 to exit): " choice

        case $choice in
            0)
                log_info "Exiting setup."
                break
                ;;
            [1-9]*)
                if [[ "$choice" -ge 1 && "$choice" -le "${#steps[@]}" ]]; then
                    step_index=$((choice-1))
                    selected_step="${steps[$step_index]}"
                    log_info "Running step: $selected_step"
                    run_step "$selected_step"
                    log_info "Step '$selected_step' finished."
                    echo # Add a newline for better readability
                else
                    log_error "Invalid choice: $choice. Please enter a number between 0 and ${#steps[@]}."
                fi
                ;;
            *)
                log_error "Invalid input. Please enter a number."
                ;;
        esac
        read -n 1 -s -r -p "Press any key to continue..." # Pause before showing menu again
        echo # Add a newline after the pause
        clear # Clear screen for the next menu display
    done
}


read -r -p "Do you want to start setup? (y/N): " start_choice

if [[ $start_choice == "y" || $start_choice == "Y" ]]; then
  log_debug "Starting the interactive setup..."
  main
else
  log_info "Setup aborted."
fi
