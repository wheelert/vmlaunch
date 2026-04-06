#!/bin/bash

# zenity
if ! command -v zenity &> /dev/null; then
    echo -e "\e[33m you must install zenity (pacman -S zenity or apt install zenity) \e[0m"
	exit
fi

if ! command -v virt-viewer &> /dev/null; then
    echo -e "\e[33m you must install virt-viewer (pacman -S virt-viewer or apt install virt-viewer) \e[0m"
        exit
fi


if zenity --question --text="Install VMLauncher?"; then

APPDIR=~/.local/share/vmlauncher

(
	echo "10"
	echo "#Checking for previous versions"
	sleep 2
	if [ -d "$APPDIR" ]; then
	echo "20"
	echo "#removing older version files"
	    rm -rf $APPDIR
	    rm ~/.local/share/applications/windows.desktop
	fi
	  sleep 2
	 echo "50"
	 echo "#Installing VMLauncher"
	mkdir $APPDIR
	#cp *.py $APPDIR
	#cp *.pyw $APPDIR

	cp microsoft.png $APPDIR
	cp windows.desktop ~/.local/share/applications/
	  sleep 2
	 echo "100"
	 echo "# Done!"
) | zenity --progress \
  --title="Installing VMLauncher" \
  --text="installing..." \
  --percentage=0 \
  --auto-close
  
 

else
    exit 1
fi
