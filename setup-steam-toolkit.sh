#!/usr/bin/env bash

# Check if script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script with sudo or as root."
  exit 1
fi

echo "Creating Steam UI script shortcuts in /usr/local/bin/..."

# 1. dlss
cat << 'EOF' > /usr/local/bin/dlss
#!/usr/bin/bash
export PROTON_ENABLE_NVAPI=1
export PROTON_ENABLE_NGX_UPDATER=1
export DXVK_NVAPI_DRS_SETTINGS="NGX_DLSS_SR_OVERRIDE=on,NGX_DLSS_RR_OVERRIDE=on,NGX_DLSS_FG_OVERRIDE=on,NGX_DLSS_SR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_default"
export DXVK_NVAPI_SET_NGX_DEBUG_OPTIONS="DLSSIndicator=0,DLSSGIndicator=0"
exec "$@"
EOF

# 2. dlsstest
cat << 'EOF' > /usr/local/bin/dlsstest
#!/usr/bin/bash
export PROTON_ENABLE_NVAPI=1
export PROTON_ENABLE_NGX_UPDATER=1
export DXVK_NVAPI_DRS_SETTINGS="NGX_DLSS_SR_OVERRIDE=on,NGX_DLSS_RR_OVERRIDE=on,NGX_DLSS_FG_OVERRIDE=on,NGX_DLSS_SR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_default"
export DXVK_NVAPI_SET_NGX_DEBUG_OPTIONS="DLSSIndicator=1024,DLSSGIndicator=2"
exec "$@"
EOF

# 3. dlssoverride
cat << 'EOF' > /usr/local/bin/dlssoverride
#!/usr/bin/bash
export PROTON_ENABLE_NVAPI=1
export PROTON_ENABLE_NGX_UPDATER=0
export DXVK_NVAPI_DRS_SETTINGS="NGX_DLSS_SR_OVERRIDE=on,NGX_DLSS_RR_OVERRIDE=on,NGX_DLSS_FG_OVERRIDE=on,NGX_DLSS_SR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_default"
export DXVK_NVAPI_SET_NGX_DEBUG_OPTIONS="DLSSIndicator=0,DLSSGIndicator=0"
exec "$@"
EOF

# 4. dlssoverridetest
cat << 'EOF' > /usr/local/bin/dlssoverridetest
#!/usr/bin/bash
export PROTON_ENABLE_NVAPI=1
export PROTON_ENABLE_NGX_UPDATER=0
export DXVK_NVAPI_DRS_SETTINGS="NGX_DLSS_SR_OVERRIDE=on,NGX_DLSS_RR_OVERRIDE=on,NGX_DLSS_FG_OVERRIDE=on,NGX_DLSS_SR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_default"
export DXVK_NVAPI_SET_NGX_DEBUG_OPTIONS="DLSSIndicator=1024,DLSSGIndicator=2"
exec "$@"
EOF

# 5. hdr
cat << 'EOF' > /usr/local/bin/hdr
#!/usr/bin/bash
export PROTON_ENABLE_WAYLAND=1
export PROTON_ENABLE_HDR=1
exec "$@"
EOF

# 6. smooth
cat << 'EOF' > /usr/local/bin/smooth
#!/usr/bin/bash
export NVPRESENT_ENABLE_SMOOTH_MOTION=1
exec "$@"
EOF

echo "Setting executable permissions..."
chmod +x /usr/local/bin/dlss /usr/local/bin/dlsstest /usr/local/bin/dlssoverride /usr/local/bin/dlssoverridetest /usr/local/bin/hdr /usr/local/bin/smooth

echo "Setup complete! The shortcuts are ready to use in the Steam UI."
