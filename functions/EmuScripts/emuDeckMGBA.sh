#!/bin/bash
#variables
mGBA_emuName="mGBA"
mGBA_emuType="AppImage"
mGBA_emuPath="$HOME/Applications/mGBA.AppImage"
mGBA_configFile="$HOME/.config/mgba/config.ini"

#cleanupOlderThings
mGBA_cleanup(){
 echo "NYI"
}

#Install
mGBA_install(){
	echo "Begin mGBA Install"
	installEmuAI "mGBA" "$(getReleaseURLGH "mgba-emu/mgba" "x64.appimage")" #mgba.AppImage
}

#ApplyInitialSettings
mGBA_init(){
	setMSG "Initializing $mGBA_emuName settings."	
	configEmuAI "$mGBA_emuName" "config" "$HOME/.config/mgba" "$EMUDECKGIT/configs/mgba" "true"
	mGBA_setupStorage
	mGBA_setEmulationFolder
	mGBA_setupSaves
	mGBA_addSteamInputProfile
}

#update
mGBA_update(){
	setMSG "Updating $mGBA_emuName settings."	
	configEmuAI "$mGBA_emuName" "config" "$HOME/.config/mgba" "$EMUDECKGIT/configs/mgba"
	mGBA_setupStorage
	mGBA_setEmulationFolder
	mGBA_setupSaves
	mGBA_addSteamInputProfile
}

#ConfigurePaths
mGBA_setEmulationFolder(){
	echo "NYI"
}

#SetupSaves
mGBA_setupSaves(){
	mkdir -p "$savesPath/mgba/saves"
	mkdir -p "$savesPath/mgba/states"
}


#SetupStorage
mGBA_setupStorage(){
	mkdir -p "$storagePath/mgba/cheats"
	mkdir -p "$storagePath/mgba/patches"
	mkdir -p "$storagePath/mgba/screenshots"
}


#WipeSettings
mGBA_wipe(){
	setMSG "Wiping $mGBA_emuName settings."
	rm -rf "$HOME/.config/mgba"
}


#Uninstall
mGBA_uninstall(){
	setMSG "Uninstalling $mGBA_emuName."
    rm -rf "$emuPath"
}

#setABXYstyle
mGBA_setABXYstyle(){
	echo "NYI"    
}

#Migrate
mGBA_migrate(){
	echo "NYI"    
}

#WideScreenOn
mGBA_wideScreenOn(){
	echo "NYI"
}

#WideScreenOff
mGBA_wideScreenOff(){
	echo "NYI"
}

#BezelOn
mGBA_bezelOn(){
echo "NYI"
}

#BezelOff
mGBA_bezelOff(){
echo "NYI"
}

mGBA_IsInstalled(){
	if [ -e "$mGBA_emuPath" ]; then
		echo "true"
	else
		echo "false"
	fi
}

mGBA_resetConfig(){
	mGBA_init &>/dev/null && echo "true" || echo "false"
}

#finalExec - Extra stuff
mGBA_finalize(){
	echo "NYI"
}

mGBA_addSteamInputProfile(){
	echo "NYI"
	setMSG "Adding $mGBA_emuName Steam Input Profile."
	rsync -r "$EMUDECKGIT/configs/steam-input/mGBA_controller_config.vdf" "$HOME/.steam/steam/controller_base/templates/"
}