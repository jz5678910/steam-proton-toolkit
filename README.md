# Steam Proton UI Environment Shortcut Toolkit

A lightweight configuration utility script that sets up ultra-short environment commands inside `/usr/local/bin/` for the Steam Launch Options UI.

Tested on Fedora 44.

## Installation
Download and run the `setup-steam-toolkit.sh` to setup your environment.

To remove, download and run the `uninstall-steam-toolkit.sh`

## Core Commands

* **DLSS Upgrade**
  * **Description:** Pulls the latest DLSS models dynamically from NVIDIA's servers. Applies the latest dynamic quality presets for both Super Resolution and Ray Reconstruction, and forces the debug text indicators off.
  * **Shortcut:** `dlss %command%`
  * **Command:** `PROTON_ENABLE_NVAPI=1 PROTON_ENABLE_NGX_UPDATER=1 DXVK_NVAPI_DRS_SETTINGS="NGX_DLSS_SR_OVERRIDE=on,NGX_DLSS_RR_OVERRIDE=on,NGX_DLSS_FG_OVERRIDE=on,NGX_DLSS_SR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_latest,NGX_DLSS_RR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_latest" DXVK_NVAPI_SET_NGX_DEBUG_OPTIONS="DLSSIndicator=0,DLSSGIndicator=0" %command%`

* **DLSS Upgrade + Version HUD**
  * **Description:** Pulls the latest DLSS models dynamically from NVIDIA's servers and applies modern Super Resolution and Ray Reconstruction presets, while displaying the version HUD to verify that the files hooked successfully.
  * **Shortcut:** `dlsstest %command%`
  * **Command:** `PROTON_ENABLE_NVAPI=1 PROTON_ENABLE_NGX_UPDATER=1 DXVK_NVAPI_DRS_SETTINGS="NGX_DLSS_SR_OVERRIDE=on,NGX_DLSS_RR_OVERRIDE=on,NGX_DLSS_FG_OVERRIDE=on,NGX_DLSS_SR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_latest,NGX_DLSS_RR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_latest" DXVK_NVAPI_SET_NGX_DEBUG_OPTIONS="DLSSIndicator=1024,DLSSGIndicator=2" %command%`

* **Manual DLSS Override**
  * **Description:** Disables the online server updater to force Proton to read custom local nvngx_dlss.dll and nvngx_dlssg.dll files manually placed inside the game folder. Forces the latest presets for Super Resolution and Ray Reconstruction with the HUD hidden.
  * **Shortcut:** `dlssoverride %command%`
  * **Command:** `PROTON_ENABLE_NVAPI=1 PROTON_ENABLE_NGX_UPDATER=0 DXVK_NVAPI_DRS_SETTINGS="NGX_DLSS_SR_OVERRIDE=on,NGX_DLSS_RR_OVERRIDE=on,NGX_DLSS_FG_OVERRIDE=on,NGX_DLSS_SR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_latest,NGX_DLSS_RR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_latest" DXVK_NVAPI_SET_NGX_DEBUG_OPTIONS="DLSSIndicator=0,DLSSGIndicator=0" %command%`

* **Manual DLSS Override + Version HUD**
  * **Description:** Disables the online server updater to force Proton to read local game folder DLL files, forcing the latest presets for Super Resolution and Ray Reconstruction while displaying the version HUD to verify the handshake.
  * **Shortcut:** `dlssoverridetest %command%`
  * **Command:** `PROTON_ENABLE_NVAPI=1 PROTON_ENABLE_NGX_UPDATER=0 DXVK_NVAPI_DRS_SETTINGS="NGX_DLSS_SR_OVERRIDE=on,NGX_DLSS_RR_OVERRIDE=on,NGX_DLSS_FG_OVERRIDE=on,NGX_DLSS_SR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_latest,NGX_DLSS_RR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_latest" DXVK_NVAPI_SET_NGX_DEBUG_OPTIONS="DLSSIndicator=1024,DLSSGIndicator=2" %command%`

* **Native Wayland HDR**
  * **Description:** Skips XWayland translation filters to unlock native high-dynamic-range color spaces and rendering options inside supported game engines.
  * **Shortcut:** `hdr %command%`
  * **Command:** `PROTON_ENABLE_WAYLAND=1 PROTON_ENABLE_HDR=1 %command%`

* **Driver-Level Smooth Motion**
  * **Description:** Injects NVIDIA driver-level frame interpolation directly into the Vulkan render path to increase visual fluidness on high-refresh-rate displays.
  * **Shortcut:** `smooth %command%`
  * **Command:** `NVPRESENT_ENABLE_SMOOTH_MOTION=1 %command%`

---

## Combined Feature Stacks

* **Native HDR + DLSS Upgrade:** `hdr dlss %command%`
* **Native HDR + DLSS Upgrade + Version HUD:** `hdr dlsstest %command%`
* **Native HDR + Manual DLSS Override:** `hdr dlssoverride %command%`
* **Native HDR + Manual DLSS Override + Version HUD:** `hdr dlssoverridetest %command%`
* **Native HDR + Driver-Level Smooth Motion:** `hdr smooth %command%`
* **DLSS Upgrade + Driver-Level Smooth Motion:** `dlss smooth %command%`
* **DLSS Upgrade + Version HUD + Driver-Level Smooth Motion:** `dlsstest smooth %command%`
* **Manual DLSS Override + Driver-Level Smooth Motion:** `dlssoverride smooth %command%`
* **Manual DLSS Override + Version HUD + Driver-Level Smooth Motion:** `dlssoverridetest smooth %command%`
* **Native HDR + DLSS Upgrade + Driver-Level Smooth Motion:** `hdr dlss smooth %command%`
* **Native HDR + DLSS Upgrade + Version HUD + Driver-Level Smooth Motion:** `hdr dlsstest smooth %command%`
* **Native HDR + Manual DLSS Override + Driver-Level Smooth Motion:** `hdr dlssoverride smooth %command%`
* **Native HDR + Manual DLSS Override + Version HUD + Driver-Level Smooth Motion:** `hdr dlssoverridetest smooth %command%`
