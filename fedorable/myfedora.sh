#!/bin/bash

# check if the script is run as root
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root. Please run with sudo or as
    the root user."
  exit 1
fi

# set PATH
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin

# variables
LOG_FILE="setup_log.txt"

# Log function
log_action() {
  local message=$1
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" | tee -a "$LOG_FILE"
}

# Function to display notifications
notify() {
  local message=$1
  local expire_time=${2:-10}
  if command -v notify-send &>/dev/null; then
    notify-send "$message" --expire-time="$expire_time"
  fi
  log_action "$message"
}

# Function to handle RPM Fusion setup
enable_rpm_fusion() {
  echo "Enabling RPM Fusion"
  sudo dnf install -y \
    https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
  sudo dnf upgrade --refresh -y
  sudo dnf group upgrade -y core
  sudo dnf install -y rpmfusion-free-release-tainted rpmfusion-nonfree-release-tainted dnf-plugins-core
  notify "RPM Fusion Enabled"
}

# Function to update firmware
update_firmware() {
  echo "Updating System Firmware"
  sudo fwupdmgr get-devices
  sudo fwupdmgr refresh --force
  sudo fwupdmgr get-updates
  sudo fwupdmgr update
  notify "System Firmware Updated"
}

# Function to speed up DNF
speed_up_dnf() {
  echo "Speeding Up DNF"
  echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf
  echo 'fastest_mirror=true' | sudo tee -a /etc/dnf/dnf.conf
  notify "Your DNF config has now been amended"
}

# Function to install software
install_software() {
  echo "Installing Software"
  if [ -f ./assets/dnf-packages.txt ]; then
    sudo dnf install -y $(cat ./assets/dnf-packages.txt)
    notify "Software has been installed"
  else
    log_action "dnf-packages.txt not found"
  fi
}

install_cosmic() {
  echo "Installing Cosmic Desktop"
  sudo dnf copr enable -y ryanabx/cosmic-epoch
  sudo dnf copr enable -y wiiznokes/cosmic-applets-unofficial
  sudo dnf install -y cosmic-desktop cosmic-ext-applet-clipboard-manager cosmic-ext-applet-minimon
  notify "Cosmic Desktop has been installed"
}

install_brave_browser() {
  echo "Installing Brave Browser"
  sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
  sudo dnf install -y brave-browser
  notify "Brave Browser has been installed"
}

install_vscode() {
  echo "Installing VS Code"

  sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
  echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo >/dev/null
  sudo dnf upgrade -y
  sudo dnf install code
  notify "VS code installed"
}

setup_git() {
  if [ -n "${GITHUB_EMAIL}" ]; then
    git config --global user.email "${GITHUB_EMAIL}"
    ssh-keygen -t ed25519 -C "${GITHUB_EMAIL}"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
  else
    echo "Email is not set. Set GITHUB_EMAIL to your git email."
  fi

  if [ -n "${GITHUB_USERNAME}" ]; then
    git config --global user.name "${GITHUB_USERNAME}"
  else
    echo "Username not set. Set GITHUB_USERNAME to your github username"
  fi
  notify "Git setup complete"
}

setup_nvim() {
  if [ -d ~/dotfiles ]; then
    cd dotfiles
    stow nvim
  else
    cd ~
    git clone https://github.com/ahmed-kaif/dotfiles.git && cd dotfiles
    stow nvim
  fi
}

setup_bashrc() {
  if hash zoxide 2>/dev/null; then
    echo 'eval "$(zoxide init bash)"' | tee -a ~/.bashrc
  else
    sudo dnf install -y zoxide
    echo 'eval "$(zoxide init bash)"' | tee -a ~/.bashrc
  fi

  if hash starship 2>/dev/null; then
    echo 'eval "$(starship init bash)"' | tee -a ~/.bashrc
  else
    sudo dnf copr enable -y atim/starship
    sudo dnf install -y starship
    echo 'eval "$(zoxide init bash)"' | tee -a ~/.bashrc
  fi
}
