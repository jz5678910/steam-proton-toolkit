#!/usr/bin/env bash

# Check if script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo or as root."
  exit 1
fi

echo "Removing Steam UI script shortcuts from /usr/local/bin/..."

# Target files array
SHORTCUTS=(dlss dlsstest dlssoverride dlssoverridetest hdr smooth)

# Loop and remove files cleanly
for cmd in "${SHORTCUTS[@]}"; do
  if [ -f "/usr/local/bin/$cmd" ]; then
    rm -f "/usr/local/bin/$cmd"
    echo "Removed: /usr/local/bin/$cmd"
  else
    echo "Skipped: /usr/local/bin/$cmd (Not found)"
  fi
done

echo "Verification pass:"
# Confirm files are truly gone
ALL_GONE=true
for cmd in "${SHORTCUTS[@]}"; do
  if [ -f "/usr/local/bin/$cmd" ]; then
    echo "[!] Warning: /usr/local/bin/$cmd still exists."
    ALL_GONE=false
  fi
done

if [ "$ALL_GONE" = true ]; then
  echo "Uninstall complete! Your system environment is completely clean."
else
  echo "Uninstall encountered an issue. Please verify permissions."
fi
