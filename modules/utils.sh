#!/bin/bash

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

run_step() {
  "$@"
  if [[ $? -ne 0 ]]; then
    log_error "Command '$*' failed"
    exit 1
  fi
}

setup_yay() {
  log_info "Started setting up yay."

  log_debug "Creating to temporary directory..."
  local temp_dir=$(mktemp -d)
  cd $temp_dir 

  log_debug "Cloning yay-bin..."
  sudo pacman -Syy --needed git base-devel
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin

  log_debug "Installing yay..."
  makepkg -si

  log_debug "Removing temp files..."
  rm -rf $temp_dir

  cd "$SETUP_DIR"

  log_success "Installed yay successfully."
}

setup_hyprland() {
  log_debug "Installing hyprland..."

  yay -S --needed --noconfirm \
    hyprland \
    hyprgraphics \
    hyprcursor \
    hyprlang \
    hyprwayland-scanner \
    hyprpaper \
    hyprutils \
    aquamarine \
    hypridle \
    hyprland-qtutils \
    hyprpicker \
    uwsm \
    xdg-desktop-portal-gtk \
    xdg-desktop-portal-hyprland

    log_success "Installed hyprland ecosystem successfully."
}

update_system() {
  log_debug "Updating system..."

  yay -Syyu --noconfirm --answerclean All --answerdiff None
  log_success "Updated successfully."
}

install_aur_packages() {
  log_debug "Installing aur packages..."

  yay -S --noconfirm --answerclean --needed All --answerdiff None \
  wayland-logout \
  ttf-ms-win11-auto \
  brave-bin \
  visual-studio-code-bin \
  shikane \
  sddm-git \
  vesktop-bin \
  bibata-cursor-theme

  log_success "Installed AUR packages successfully."
}

install_essentials() {
  log_debug "Installing essential packages..."

  yay -S --noconfirm --needed --answerclean All --answerdiff None \
    alacritty \
    kitty \
    mako \
    neovim \
    rofi-wayland \
    waybar \
    wlogout \
    libreoffice-fresh \
    mariadb \
    jdk21-openjdk \
    btop \
    network-manager-applet \
    polkit-gnome \
    gnome-keyring \
    nwg-look \
    xorg-xhost \
    nautilus \
    eog \
    brightnessctl \
    7zip \
    github-cli \
    bat \
    btop \
    clang \
    flatpak \
    grim \
    slurp \
    grub-customizer \
    libnotify \
    mpv \
    nodejs \
    npm \
    os-prober \
    qbittorrent \
    rustup \
    stow \
    unrar \
    unzip \
    wl-clipboard \
    zip \
    zoxide \
    yazi \
    qt6-svg \
    qt6-declarative \
    qt5-quickcontrols2 \
    inter-font \
    gtk-engine-murrine \
    sassc \
    zsh \
    php \
    httpd \
    apache \
    php-apache \
    php-gd \
    php-igbinary \
    php-pgsql \
    php-redis \
    php-sqlite \
    phpmyadmin \
    composer \
    ttf-jetbrains-mono-nerd \
    ttf-iosevka-nerd \
    ttf-cascadia-code-nerd \
    ttf-fantasque-nerd \ 

    log_success "Installed essential packages successfully."
}
