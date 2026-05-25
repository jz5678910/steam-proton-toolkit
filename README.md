# Steam Proton UI Environment Shortcut Toolkit

A lightweight configuration utility script that sets up ultra-short environment commands inside `/usr/local/bin/` for the Steam Launch Options UI.

## Core Commands

* **Silent Cloud DLSS Upgrades**
  * **Shortcut:** `dlss %command%`
  * **Command:** `PROTON_ENABLE_NVAPI=1 PROTON_ENABLE_NGX_UPDATER=1 DXVK_NVAPI_DRS_SETTINGS="NGX_DLSS_SR_OVERRIDE=on,NGX_DLSS_RR_OVERRIDE=on,NGX_DLSS_FG_OVERRIDE=on,NGX_DLSS_SR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_default" DXVK_NVAPI_SET_NGX_DEBUG_OPTIONS="DLSSIndicator=0,DLSSGIndicator=0" %command%`

* **Cloud DLSS Upgrades + Version HUD**
  * **Shortcut:** `dlsstest %command%`
  * **Command:** `PROTON_ENABLE_NVAPI=1 PROTON_ENABLE_NGX_UPDATER=1 DXVK_NVAPI_DRS_SETTINGS="NGX_DLSS_SR_OVERRIDE=on,NGX_DLSS_RR_OVERRIDE=on,NGX_DLSS_FG_OVERRIDE=on,NGX_DLSS_SR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_default" DXVK_NVAPI_SET_NGX_DEBUG_OPTIONS="DLSSIndicator=1024,DLSSGIndicator=2" %command%`

* **Manual Folder DLSS Override**
  * **Shortcut:** `dlssoverride %command%`
  * **Command:** `PROTON_ENABLE_NVAPI=1 PROTON_ENABLE_NGX_UPDATER=0 DXVK_NVAPI_DRS_SETTINGS="NGX_DLSS_SR_OVERRIDE=on,NGX_DLSS_RR_OVERRIDE=on,NGX_DLSS_FG_OVERRIDE=on,NGX_DLSS_SR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_default" DXVK_NVAPI_SET_NGX_DEBUG_OPTIONS="DLSSIndicator=0,DLSSGIndicator=0" %command%`

* **Manual Folder DLSS Override + Version HUD**
  * **Shortcut:** `dlssoverridetest %command%`
  * **Command:** `PROTON_ENABLE_NVAPI=1 PROTON_ENABLE_NGX_UPDATER=0 DXVK_NVAPI_DRS_SETTINGS="NGX_DLSS_SR_OVERRIDE=on,NGX_DLSS_RR_OVERRIDE=on,NGX_DLSS_FG_OVERRIDE=on,NGX_DLSS_SR_OVERRIDE_RENDER_PRESET_SELECTION=render_preset_default" DXVK_NVAPI_SET_NGX_DEBUG_OPTIONS="DLSSIndicator=1024,DLSSGIndicator=2" %command%`

* **Native Wayland HDR Only**
  * **Shortcut:** `hdr %command%`
  * **Command:** `PROTON_ENABLE_WAYLAND=1 PROTON_ENABLE_HDR=1 %command%`

* **Driver-Level Smooth Motion Only**
  * **Shortcut:** `smooth %command%`
  * **Command:** `NVPRESENT_ENABLE_SMOOTH_MOTION=1 %command%`

---

## Combined Feature Stacks

* **Native HDR + Silent Cloud DLSS:** `hdr dlss %command%`
* **Native HDR + Cloud DLSS with HUD:** `hdr dlsstest %command%`
* **Native HDR + Manual Folder Override:** `hdr dlssoverride %command%`
* **Native HDR + Manual Override with HUD:** `hdr dlssoverridetest %command%`
* **Native HDR + Driver-Level Smooth Motion:** `hdr smooth %command%`
* **Silent Cloud DLSS + Driver-Level Smooth Motion:** `dlss smooth %command%`
* **Cloud DLSS with HUD + Driver-Level Smooth Motion:** `dlsstest smooth %command%`
* **Manual Folder DLSS Override + Driver-Level Smooth Motion:** `dlssoverride smooth %command%`
* **Manual Override with HUD + Driver-Level Smooth Motion:** `dlssoverridetest smooth %command%`
* **Native HDR + Silent Cloud DLSS + Driver-Level Smooth Motion:** `hdr dlss smooth %command%`
* **Native HDR + Cloud DLSS with HUD + Driver-Level Smooth Motion:** `hdr dlsstest smooth %command%`
* **Native HDR + Manual Folder Override + Driver-Level Smooth Motion:** `hdr dlssoverride smooth %command%`
* **Native HDR + Manual Override with HUD + Driver-Level Smooth Motion:** `hdr dlssoverridetest smooth %command%`
