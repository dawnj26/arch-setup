#!/bin/bash

log_info() {
  local color='\033[0;36m'  # Cyan
  local reset='\033[0m'
  local message="[INFO] $(date +'%Y-%m-%d %H:%M:%S'): $1"

  printf "%b%s%b\n" "$color" "$message" "$reset"
  echo "$message" >> "$LOG_FILE"
}

log_error() {
  local color='\033[0;31m'  # Red
  local reset='\033[0m'
  local message="[ERROR] $(date +'%Y-%m-%d %H:%M:%S'): $1"

  printf "%b%s%b\n" "$color" "$message" "$reset" >&2
  echo "$message" >> "$LOG_FILE"
}

log_warning() {
  local color='\033[0;33m'  # Yellow
  local reset='\033[0m'
  local message="[WARNING] $(date +'%Y-%m-%d %H:%M:%S'): $1"

  printf "%b%s%b\n" "$color" "$message" "$reset"
  echo "$message" >> "$LOG_FILE"
}

log_debug() {
  local color='\033[0;35m'  # Purple
  local reset='\033[0m'
  local message="[DEBUG] $(date +'%Y-%m-%d %H:%M:%S'): $1"

  printf "%b%s%b\n" "$color" "$message" "$reset"
  echo "$message" >> "$LOG_FILE"
}

log_success() {
  local color='\033[0;32m'  # Green
  local reset='\033[0m'
  local message="[SUCCESS] $(date +'%Y-%m-%d %H:%M:%S'): $1"

  printf "%b%s%b\n" "$color" "$message" "$reset"
  echo "$message" >> "$LOG_FILE"
}

error_handler() {
  log_error "Line $1"
  exit 1
}
