#! /bin/bash
echo "This script is developed & tested by me (ScardracS) for the Motorola Moto X Play/Pure/Style."
echo "Feel free to use and/or modify it, but please give me proper credits."
echo "I don't assume any responsibility if You damage your device/s, You have been warned!"
echo
echo "First of all please select your PC's OS."
echo "1 + enter for apt (debian/ubuntu/mint)."
echo "2 + enter for yum (fedora/red-hat)."
echo "3 + enter for pacman (archlinux/manjaro)."
echo "4 + enter for emerge (gentoo/funtoo/sabayon)."
echo "5 + enter for apk (alpine linux)."
echo "Any other values to stop this script and exit."
echo
echo "Any answer on that script MUST be lowercase."
echo
read A
case $A in
		1)	sudo apt-get install -y adb fastboot
		;;
		2)	sudo yum install android-tools
		;;
		3)	sudo pacman -Sy adb fastboot
		;;
		4)	sudo emerge --ask android-sdk-update-manager
		;;
		5)	sudo apk add android-tools
		;;
		*)	echo "Script stopped!" && exit
	esac
clear
echo "REMEMBER, DON'T PRESS ANYTHING DURING THE FLASHING PROCESS!!"
echo "Are You Ready? (y/n)"
read B
case $B in
	y)
		echo "Do you want to delete userdata? (y/n)"
		read C
		case $C in
			y)
				clear
				echo "Wipe Script"
				sudo adb reboot-bootloader
				sudo fastboot oem fb_mode_set
				sudo fastboot flash partition gpt.bin
				sudo fastboot flash bootloader bootloader.img
				sudo fastboot flash logo logo.bin
				sudo fastboot flash boot boot.img
				sudo fastboot flash recovery recovery.img
				sudo fastboot flash system system.img_sparsechunk.0
				sudo fastboot flash system system.img_sparsechunk.1
				sudo fastboot flash system system.img_sparsechunk.2
				sudo fastboot flash system system.img_sparsechunk.3
				sudo fastboot flash system system.img_sparsechunk.4
				sudo fastboot flash system system.img_sparsechunk.5
				sudo fastboot flash system system.img_sparsechunk.6
				sudo fastboot flash system system.img_sparsechunk.7
				sudo fastboot flash system system.img_sparsechunk.8
				sudo fastboot flash system system.img_sparsechunk.9
				sudo fastboot flash system system.img_sparsechunk.10
				sudo fastboot flash modem NON-HLOS.bin
				sudo fastboot erase modemst1
				sudo fastboot erase modemst2
				sudo fastboot flash fsg fsg.mbn
				sudo fastboot erase cache
				sudo fastboot erase userdata
				sudo fastboot erase customize
				sudo fastboot erase clogo
				sudo fastboot oem fb_mode_clear
				sudo fastboot reboot
				clear
				exit
			;;
			n)
				clear
				echo "No Wipe Script"
				sudo adb reboot-bootloader
				sudo fastboot oem fb_mode_set
				sudo fastboot flash partition gpt.bin
				sudo fastboot flash bootloader bootloader.img
				sudo fastboot flash logo logo.bin
				sudo fastboot flash boot boot.img
				sudo fastboot flash recovery recovery.img
				sudo fastboot flash system system.img_sparsechunk.0
				sudo fastboot flash system system.img_sparsechunk.1
				sudo fastboot flash system system.img_sparsechunk.2
				sudo fastboot flash system system.img_sparsechunk.3
				sudo fastboot flash system system.img_sparsechunk.4
				sudo fastboot flash system system.img_sparsechunk.5
				sudo fastboot flash system system.img_sparsechunk.6
				sudo fastboot flash system system.img_sparsechunk.7
				sudo fastboot flash system system.img_sparsechunk.8
				sudo fastboot flash system system.img_sparsechunk.9
				sudo fastboot flash system system.img_sparsechunk.10
				sudo fastboot flash modem NON-HLOS.bin
				sudo fastboot erase modemst1
				sudo fastboot erase modemst2
				sudo fastboot flash fsg fsg.mbn
				sudo fastboot erase cache
				sudo fastboot erase customize
				sudo fastboot erase clogo
				sudo fastboot oem fb_mode_clear
				sudo fastboot reboot
				clear
				exit
			;;
			*)
				clear
				echo "Script stopped!"
				exit
			;;
		esac
	;;
	*)
		clear
		echo "Script stopped!"
		exit
	;;
esac
exit
