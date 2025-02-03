setup_directory=$(pwd)

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

setup_yay() {
  log_info "Installing yay..."

  temp_dir=$(mktemp -d)
  cd "$temp_dir" || log_error "Failed to create temporary directory"

  sudo pacman -Syy --needed git base-devel
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin || log_error "Cloning failed." && exit 1
  makepkg -si || log_error "Failed to install yay." && exit 1

  rm -rf "$temp_dir"

  cd "$setup_directory" || log_error "Failed to cd on root setup directory." && exit 1
}

setup_hyprland() {
  log_info "Installing hyprland..."

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
    xdg-desktop-portal-hyprland || log_error "Failed to install hyprland" && exit 1
}

update_system() {
  yay -Syyu --noconfirm --answerclean All --answerdiff None || log_error "System upgrade failed." && exit 1
}

install_essentials() {
  log_info "Installing essential packages..."

  yay -S --noconfirm --answerclean All --answerdiff None \
    alacritty \
    kitty \
    mako \
    neovim \
    rofi-wayland \
    waybar \
    wlogout \
    wayland-logout \
    ttf-ms-win11-auto \
    libreoffice-fresh \
    jdk17-openjdk \
    btop \
    network-manager-applet \
    polkit-gnome \
    nwg-look \
    brave-bin \
    xorg-xhost \
    nautilus \
    eog \
    brightnessctl \
    visual-studio-code-bin \
    7zip \
    bat \
    btop \
    clang \
    flatpak \
    grim \
    slurp \
    grub-customizer \
    jdk17-openjdk \
    libnotify \
    mpv \
    nodejs \
    npm \
    os-prober \
    qbittorrent \
    rustup \
    shikane \
    sddm-git \
    stow \
    unrar \
    unzip \
    vesktop-bin \
    wl-clipboard \
    zip \
    zoxide \
    yazi \
    bibata-cursor-theme \
    qt6-svg \
    qt6-declarative \
    qt5-quickcontrols2 \
    inter-font \
    gtk-engine-murrine \
    sassc \
    zsh || log_error "Failed to install essential packages" && exit 1
}
