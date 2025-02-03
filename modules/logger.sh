# Reset
Color_Off='\033[0m' # Text Reset

# Regular Colors
Red='\033[0;31m'    # Red
Yellow='\033[0;33m' # Yellow
Cyan='\033[0;36m'   # Cyan

log_info() {
  echo -e "${Cyan}[INFO] $(date +%r): $1${Color_Off}"
}

log_error() {
  echo -e "${Red}[ERROR] $(date +%r): $1${Color_Off}"
}

log_debug() {
  echo -e "[DEBUG] $(date +%r): $1"
}

log_warning() {
  echo -e "${Yellow}[WARNING] $(date +%r): $1${Color_Off}"
}
