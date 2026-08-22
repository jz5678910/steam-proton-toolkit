#!/usr/bin/env bash

echo "Removing Steam UI script shortcuts from $HOME/..."

# Target directory is now the user's home folder
BIN_DIR="$HOME"

# Target files array
SHORTCUTS=(dlss dlsstest dlssoverride dlssoverridetest hdr smooth)

# Loop and remove files cleanly
for cmd in "${SHORTCUTS[@]}"; do
  if [ -f "$BIN_DIR/$cmd" ]; then
    rm -f "$BIN_DIR/$cmd"
    echo "Removed: $BIN_DIR/$cmd"
  else
    echo "Skipped: $BIN_DIR/$cmd (Not found)"
  fi
done

echo "Verification pass:"
# Confirm files are truly gone
ALL_GONE=true
for cmd in "${SHORTCUTS[@]}"; do
  if [ -f "$BIN_DIR/$cmd" ]; then
    echo "[!] Warning: $BIN_DIR/$cmd still exists."
    ALL_GONE=false
  fi
done

if [ "$ALL_GONE" = true ]; then
  echo "Uninstall complete! Your home directory is completely clean."
else
  echo "Uninstall encountered an issue. Please verify file permissions."
fi
