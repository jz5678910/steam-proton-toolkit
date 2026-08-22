#!/usr/bin/env bash

echo "Creating Steam UI script shortcuts in $HOME/ for immutable Flatpak compatibility..."

# 1. dlss
cat << 'EOF' > "$HOME/dlss"
#!/usr/bin/bash
export PROTON_ENABLE_NVAPI=1
export PROTON_ENABLE_NGX_UPDATER=1
export DXVK_NVAPI_DRS_SETTINGS="NGX_DLSS_SR_OVERRIDE=on,NGX_DLSS_RR_OVERRIDE=on,NGX_DLSS_FG_OVERRIDE=on,NGX_DLSS_SR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_latest,NGX_DLSS_RR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_latest"
export DXVK_NVAPI_SET_NGX_DEBUG_OPTIONS="DLSSIndicator=0,DLSSGIndicator=0"
exec "$@"
EOF

# 2. dlsstest
cat << 'EOF' > "$HOME/dlsstest"
#!/usr/bin/bash
export PROTON_ENABLE_NVAPI=1
export PROTON_ENABLE_NGX_UPDATER=1
export DXVK_NVAPI_DRS_SETTINGS="NGX_DLSS_SR_OVERRIDE=on,NGX_DLSS_RR_OVERRIDE=on,NGX_DLSS_FG_OVERRIDE=on,NGX_DLSS_SR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_latest,NGX_DLSS_RR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_latest"
export DXVK_NVAPI_SET_NGX_DEBUG_OPTIONS="DLSSIndicator=1024,DLSSGIndicator=2"
exec "$@"
EOF

# 3. dlssoverride
cat << 'EOF' > "$HOME/dlssoverride"
#!/usr/bin/bash
export PROTON_ENABLE_NVAPI=1
export PROTON_ENABLE_NGX_UPDATER=0
export DXVK_NVAPI_DRS_SETTINGS="NGX_DLSS_SR_OVERRIDE=on,NGX_DLSS_RR_OVERRIDE=on,NGX_DLSS_FG_OVERRIDE=on,NGX_DLSS_SR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_latest,NGX_DLSS_RR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_latest"
export DXVK_NVAPI_SET_NGX_DEBUG_OPTIONS="DLSSIndicator=0,DLSSGIndicator=0"
exec "$@"
EOF

# 4. dlssoverridetest
cat << 'EOF' > "$HOME/dlssoverridetest"
#!/usr/bin/bash
export PROTON_ENABLE_NVAPI=1
export PROTON_ENABLE_NGX_UPDATER=0
export DXVK_NVAPI_DRS_SETTINGS="NGX_DLSS_SR_OVERRIDE=on,NGX_DLSS_RR_OVERRIDE=on,NGX_DLSS_FG_OVERRIDE=on,NGX_DLSS_SR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_latest,NGX_DLSS_RR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_latest"
export DXVK_NVAPI_SET_NGX_DEBUG_OPTIONS="DLSSIndicator=1024,DLSSGIndicator=2"
exec "$@"
EOF

# 5. hdr
cat << 'EOF' > "$HOME/hdr"
#!/usr/bin/bash
export PROTON_ENABLE_WAYLAND=1
export PROTON_ENABLE_HDR=1
exec "$@"
EOF

# 6. smooth
cat << 'EOF' > "$HOME/smooth"
#!/usr/bin/bash
export NVPRESENT_ENABLE_SMOOTH_MOTION=1
exec "$@"
EOF

# 7. gsc (Gamescope Ultrawide)
cat << 'EOF' > "$HOME/gsc"
#!/usr/bin/bash
exec gamescope -W 3440 -H 1440 --hdr-enabled --adaptive-sync -f -- "$@"
EOF

echo "Setting executable permissions..."
chmod +x "$HOME/dlss" "$HOME/dlsstest" "$HOME/dlssoverride" "$HOME/dlssoverridetest" "$HOME/hdr" "$HOME/smooth" "$HOME/gsc"

echo "Applying Flatpak override to grant Steam access to your home directory..."
flatpak override --user --filesystem=home com.valvesoftware.Steam

echo "Setup complete! The shortcuts are ready to deploy."
echo "Inside Steam Launch Options, be sure to use the tilde path, for example: ~/hdr %command%"
