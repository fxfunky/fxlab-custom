#!/bin/bash
software_to_install="mc nano rsync htop"

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

	# Check if apt-get is available
	if command -v apt-get &>/dev/null; then
    	echo "Using apt-get for package installation."
		echo "Following packages will be instaled: " $software_to_install
# INSTALL BASIC SOFTWARE WITH APT
		sudo apt-get update && sudo apt-get install $software_to_install

	# Check if yum is available
	elif command -v yum &>/dev/null; then
    	echo "Using yum for package installation."
		echo "Following packages will be instaled: " $software_to_install
    	# INSTALL BASIC SOFTWARE USING YUM
		sudo yum install $software_to_install



	else
    	echo "Neither apt-get nor yum found. Cannot install packages."
    	exit 1

	fi

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
