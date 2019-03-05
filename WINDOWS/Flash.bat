@echo off
:WARNING
	echo Created by me (ScardracS) for the Motorola Moto X Play/Pure/Style.
	echo You can use and/or modify that script, but please provide to me proper credit.
	echo I've tested it on Moto X Play, but I'm not responsible for any damage, You've been warned!
	echo You will be able to quit the installer simply press K on any question.
	echo
	echo You have to download the stock ROM for your device before proceed.
:START
	cls
	echo Have You already installed ADB and Fastboot? (Y/N/K)
	set /p a=
	if /i "%a%"=="Y" GOTO STARTINSTALL
	if /i "%a%"=="N" GOTO ADB
	if /i "%a%"=="K" GOTO END
	echo Wrong Answer!
	GOTO START
:ADB
	cls
	echo This is the ADB and Fastboot's downloader and installer. (Thank's to XDA@HackSlash)
	echo You have to install both ADB, Fastboot and Drivers in order to install STOCK ROMs.
	echo It's better to install it System Wide.
	start https://github.com/hackslashX/ADB-Fastboot-Installer-for-Windows/raw/master/versions/adb_fastboot_installer-1.2s.exe
	pause
	start adb_fastboot_installer-1.2s.exe
:STARTINSTALL
	cls
	echo Are You ready to intall STOCK ROM? (Y/N/K)
	set /p b=
	if /i "%b%"=="Y" GOTO READY
	if /i "%b%"=="N" GOTO START
	if /i "%b%"=="K" GOTO END
	echo Wrong answer!
	GOTO STARTINSTALL
:READY
	cls
	echo Do you want to delete user data? (Y/N/K)
	set /p d=
	if /i "%d%"=="Y" GOTO WIPE
	if /i "%d%"=="N" GOTO NOWIPE
	if /i "%d%"=="K" GOTO END
	echo Wrong answer!
	GOTO READY
:WIPE
	cls
	echo WIPE SUBSCRIPT
	echo DO NOT STOP THE FLASHING PROCESS!!
	adb reboot-bootloader
	echo FOLLOW THE INSTRUCTIONS ON WATCH ME FOLDER AND THAN HIT ENTER
	pause
	fastboot oem fb_mode_set
	fastboot flash partition gpt.bin
	fastboot flash bootloader bootloader.img
	fastboot flash logo logo.bin
	fastboot flash boot boot.img
	fastboot flash recovery recovery.img
	fastboot flash system system.img_sparsechunk.0
	fastboot flash system system.img_sparsechunk.1
	fastboot flash system system.img_sparsechunk.2
	fastboot flash system system.img_sparsechunk.3
	fastboot flash system system.img_sparsechunk.4
	fastboot flash system system.img_sparsechunk.5
	fastboot flash system system.img_sparsechunk.6
	fastboot flash system system.img_sparsechunk.7
	fastboot flash system system.img_sparsechunk.8
	fastboot flash modem NON-HLOS.bin
	fastboot erase modemst1
	fastboot erase modemst2
	fastboot flash fsg fsg.mbn
	fastboot erase cache
	fastboot erase userdata
	fastboot erase customize
	fastboot erase clogo
	fastboot oem fb_mode_clear
	GOTO LOOK
:NOWIPE
	cls
	echo NOWIPE SUBSCRIPT
	echo DO NOT STOP THE FLASHING PROCESS!!
	adb reboot-bootloader
	echo FOLLOW THE INSTRUCTIONS ON WATCH ME FOLDER AND THAN HIT ENTER
	pause
	fastboot oem fb_mode_set
	fastboot flash partition gpt.bin
	fastboot flash bootloader bootloader.img
	fastboot flash logo logo.bin
	fastboot flash boot boot.img
	fastboot flash recovery recovery.img
	fastboot flash system system.img_sparsechunk.0
	fastboot flash system system.img_sparsechunk.1
	fastboot flash system system.img_sparsechunk.2
	fastboot flash system system.img_sparsechunk.3
	fastboot flash system system.img_sparsechunk.4
	fastboot flash system system.img_sparsechunk.5
	fastboot flash system system.img_sparsechunk.6
	fastboot flash system system.img_sparsechunk.7
	fastboot flash system system.img_sparsechunk.8
	fastboot flash modem NON-HLOS.bin
	fastboot erase modemst1
	fastboot erase modemst2
	fastboot flash fsg fsg.mbn
	fastboot erase cache
	fastboot erase customize
	fastboot erase clogo
	fastboot oem fb_mode_clear
:LOOK
	echo Do you want to lock your device? (Y/N)
	set /p e=
	if /i "%d%"=="Y" GOTO LOCK
	if /i "%d%"=="N" GOTO END
	echo Wrong answer!
	GOTO READY
:LOCK
	echo Locking device
	fastboot oem lock
	echo Device locked
:END
	fastboot reboot
	cls
	echo Enjoy! :D
	pause
