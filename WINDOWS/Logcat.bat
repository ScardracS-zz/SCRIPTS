@echo off
:WARNING
	echo This script is made and tested by me (ScardracS).
	echo You can use and/or modify it, but please give me proper credit.
:START
	echo
	echo Have You installed ADB? (Y/N/K)
	set /p a=
	if /i "%a%"=="Y" GOTO LOGCAT
	if /i "%a%"=="N" GOTO INSTALLER
	if /i "%a%"=="K" GOTO END
	echo Wrong Answer!
	GOTO START
:INSTALLER
	cls
	echo This is the ADB and Fastboot's downloader and installer. (Thank's to XDA@HackSlash)
	echo You have to install both ADB, Fastboot and Drivers in order to install STOCK ROMs.
	echo It's better to install it System Wide.
	start https://github.com/hackslashX/ADB-Fastboot-Installer-for-Windows/raw/master/versions/adb_fastboot_installer-1.2s.exe
	pause
	start adb_fastboot_installer-1.2s.exe
:LOGCAT
	cls
	echo Do you want to overwrite previous file? (Y/N/K)
	set /p b=
	if /i "%b%"=="Y" GOTO OVERWRITE
	if /i "%b%"=="N" GOTO NO_OVERWRITE
	if /i "%b%"=="K" GOTO END
	echo Wrong Answer!
	GOTO LOGCAT
:OVERWRITE
	cls
	adb logcat > logcat.txt
	GOTO END
:NO_OVERWRITE
	cls
	adb logcat >> logcat.txt
:END
	cls
	pause
