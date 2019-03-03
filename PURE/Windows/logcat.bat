@echo off
:WARNING
	echo This script is made and tested by me (ScardracS).
	echo You can use and/or modify it, but please give me proper credit.
:START
	echo.
	echo Have You installed ADB? (Yes/No/Kill the script)
	set /p a=
	if /i "%a%"=="Y" GOTO LOGCAT
	if /i "%a%"=="N" GOTO INSTALLER
	if /i "%a%"=="K" GOTO END
	echo Wrong Answer!
	GOTO START
:INSTALLER
	cls
	echo I'll install ADB
	echo Please install both ADB, Fatsboot and Drivers.
	start adbinstaller.exe
	pause
:LOGCAT
	cls
	echo Do you want to overwrite previous file? (Yes/No/Kill the script)
	set /p b=
	if /i "%b%"=="Y" GOTO OVER
	if /i "%b%"=="N" GOTO NOVER
	if /i "%b%"=="K" GOTO END
	echo Wrong Answer!
	GOTO LOGCAT
:OVER
	cls
	adb logcat > logact.txt
	GOTO END
:NOVER
	cls
	adb logcat >> logcat.txt
:END
	cls
	pause
:END
	cls
	pause
