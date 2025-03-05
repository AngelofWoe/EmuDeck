#!/usr/bin/env bash

# emuDeckCHD

# Variables
# shellcheck disable=2034
CHD_toolName="EmuDeck Compression Tool"
CHD_toolType="script"
# shellcheck disable=2154
CHD_toolPath="${toolsPath}/chdconv/chddeck.sh"
CHD_Shortcutlocation="${HOME}/Desktop/EmuDeckCHD.desktop"

# install
CHD_install(){
    # shellcheck disable=2154
    rsync -avhp --mkpath "${emudeckBackend}/tools/chdconv" "${toolsPath}/"
    
    chmod +x "${CHD_toolPath}"
    chmod +x "${toolsPath}/chdconv/chdman5"
    
    # update the paths in the script
    # shellcheck disable=2154
    sed -i "s|/run/media/mmcblk0p1/Emulation/roms|${romsPath}|g" "${CHD_toolPath}"
    sed -i "s|/run/media/mmcblk0p1/Emulation/tools|${toolsPath}|g" "${CHD_toolPath}"
    
    #createDesktopShortcut "$CHD_Shortcutlocation" "$CHD_toolName" "bash $CHD_toolPath" "True"
}

