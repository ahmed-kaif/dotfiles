#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e


# Check the distribution name and version and abort if incompatible
source ~/dotfiles/ubuntu/install/check-version.sh

echo "Installing Gum..."
source ~/dotfiles/ubuntu/install/terminal/required/app-gum.sh >/dev/null

# Desktop software and tweaks will only be installed if we're running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  # Ensure computer doesn't go to sleep or lock while installing
  gsettings set org.gnome.desktop.screensaver lock-enabled false
  gsettings set org.gnome.desktop.session idle-delay 0

  echo "Installing terminal and desktop tools..."

  # Install terminal tools
  source ~/dotfiles/ubuntu/install/terminal.sh

  # Install desktop tools and tweaks
  source ~/dotfiles/ubuntu/install/desktop.sh

  # Revert to normal idle and lock settings
  gsettings set org.gnome.desktop.screensaver lock-enabled true
  gsettings set org.gnome.desktop.session idle-delay 300
elif [[ "$XDG_CURRENT_DESKTOP" == *"COSMIC"* ]]; then
  echo "Installing terminal and desktop tools..."

  # Install terminal tools
  source ~/dotfiles/ubuntu/install/terminal.sh

  # Install desktop tools and tweaks
  source ~/dotfiles/ubuntu/install/desktop.sh
else
  echo "Only installing terminal tools..."
  source ~/dotfiles/ubuntu/install/terminal.sh
fi
