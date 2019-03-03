@echo off
:WARNING
	echo Created by ScardracS for the Moto X Play.
	echo I am not responsible for any damage, you're been warned!
	echo You will be able to quit the installer simply press K on any question.
	pause
:START
	cls
	echo Have You already installed ADB and Fastboot? (Yes/No/Kill the script)
	set /p a=
	if /i "%a%"=="Y" GOTO ROM
	if /i "%a%"=="N" GOTO INSTALLER
	if /i "%a%"=="K" GOTO END
	echo Wrong Answer!
	GOTO START
:INSTALLER
	cls
	echo This is the ADB and Fastboot's installer.
	echo You have to install both ADB, Fastboot and Drivers.
	echo It's better to install it System Wide.
	pause
	start adbinstaller.exe
	pause
:ROM
	cls
	echo Have You already downloaded the Stock ROM? (Yes/No/Kill the script)
	set /p b=
	if /i "%b%"=="Y" GOTO STARTINSTALL
	if /i "%b%"=="N" GOTO DOWNLOAD
	if /i "%b%"=="K" GOTO END
	echo Wrong answer!
	GOTO ROM
:DOWNLOAD
	cls
	echo I'll open GitHub where You will be able to choose your preferred Stock version.
	start https://github.com/motoxplay/stock/
	echo WHEN THE DOWNLOAD IS FINISHED PLEASE UNZIP AND MOVE HERE ALL THE FILES.
	pause
:STARTINSTALL
	cls
	echo Are You ready to intall STOCK ROM? (Yes/No/Kill the script)
	set /p c=
	if /i "%c%"=="Y" GOTO READY
	if /i "%c%"=="N" GOTO START
	if /i "%c%"=="K" GOTO END
	echo Wrong answer!
	GOTO STARTINSTALL
:READY
	cls
	echo Do you want to delete user data? (Yes/No/Kill the script)
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
	echo Do you want to lock your device? (Yes/No)
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
