#!/bin/bash

# WELCOME MESSAGE
echo " "
echo " > Hello!"
echo " > This script will install fxlab-custom settings for current linux environment"
echo " > Backup of all existing configuration files will be created with suffix _backup in home directory"
echo " "

read -p "Do you want to continue (Y/N)? " choice

# CONFIRMATION
if [ "$choice" == "Y" ] || [ "$choice" == "y" ]; then
	echo "fxlab-custom will be installed..."

	# INSTALL BASIC SOFTWARE
	sudo apt-get update && sudo apt-get install mc nano rsync htop

	# COPY CUSTOM CONFIGURATION FILES
	mv $HOME/.bashrc $HOME/.bashrc_backup && cp .bashrc $HOME/.bashrc
	mv $HOME/.nanorc $HOME/.nanorc_backup && cp .nanorc $HOME/.nanorc
	sudo cp fxlab-custom.ini /usr/share/mc/skins/.
	mv $HOME/.config/mc/ini $HOME/.config/mc/ini_backup && cp ini $HOME/.config/mc/ini

elif [ "$choice" == "N" ] || [ "$choice" == "n" ]; then
    echo "Exiting the script."
    exit 0
else
    echo "Invalid choice. Please enter Y for Yes or N for No."
fi
