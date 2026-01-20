#!/bin/bash

# Get the directory of the launcher script (one directory up from the location of this installer script)
INSTALLER_DIR=$(dirname "$(realpath "$0")")
EXEC_PATH="${INSTALLER_DIR}/../Linux-64-cultris2.sh"

# Directory to save .desktop file in
DESKTOP_FILE="$HOME/.local/share/applications/cultris2.desktop"

if [ -f "$DESKTOP_FILE" ]; then
  echo "$DESKTOP_FILE already exists. Skipping creation of the .desktop file."
else
  DESKTOP_FILE_CONTENT="[Desktop Entry]
  Name=Cultris2
  Comment=Play Cultris2
  Exec=${EXEC_PATH}
  Icon=cultris2
  Terminal=false
  Type=Application
  Categories=Game;"
  
  echo "$DESKTOP_FILE_CONTENT" > "$DESKTOP_FILE"
  
  chmod +x "$DESKTOP_FILE"
  echo "$DESKTOP_FILE created and marked as executable."
fi

# Download cultris icon from gewaltig.net/favicon.png if we don't already have it
ICON_PATH="$HOME/.local/share/icons/hicolor/128x128/apps/cultris2.png"

if [ -f "$ICON_PATH" ]; then
  echo "Icon already exists at $ICON_PATH. Skipping download."
else
  wget -O "$ICON_PATH" https://gewaltig.net/favicon.png
  
  gtk-update-icon-cache -f ~/.local/share/icons/hicolor
  echo "Icon downloaded to $ICON_PATH and cache updated."
fi

echo "Cultris2 desktop shortcut setup complete!"
