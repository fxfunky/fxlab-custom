#!/bin/bash
software_to_install="mc nano rsync htop"
is_root=$(whoami)
echo "$is_root is current user."



# WELCOME MESSAGE
echo " "
echo " > Hello!"
echo " > This script will install fxlab-custom settings for current linux environment"
echo " > Backup of all existing configuration files will be created with suffix _backup in home directory"
echo " "

read -p "Do you want to continue? [Y/N] " choice

# CONFIRMATION
if [ "$choice" == "Y" ] || [ "$choice" == "y" ]; then
	echo "fxlab-custom will be installed"

	# Check if apt-get is available
	if command -v apt-get &>/dev/null; then
    	echo "Using apt-get for package installation."
		echo "Following packages will be instaled: " $software_to_install

		# INSTALL BASIC SOFTWARE WITH APT
		if [ "$is_root" == "root" ]; then
			apt-get update && apt-get install $software_to_install
		else
			sudo apt-get update && sudo apt-get install $software_to_install
		fi

	# Check if yum is available
	elif command -v yum &>/dev/null; then
    	echo "Using yum for package installation."
		echo "Following packages will be instaled: " $software_to_install

		# INSTALL BASIC SOFTWARE USING YUM
		if [ "$is_root" == "root" ]; then
			yum install $software_to_install
		else
			sudo yum install $software_to_install
		fi

	else
    	echo "Neither apt-get nor yum found. Cannot install packages."
    	exit 1

	fi

	# COPY CUSTOM CONFIGURATION FILES
	echo "Custom configuration files will be copied"
	mv $HOME/.bashrc $HOME/.bashrc_backup && cp .bashrc $HOME/.bashrc
	
	if test -e $HOME/.nanorc; then
    	mv $HOME/.nanorc $HOME/.nanorc_backup
    	cp .nanorc $HOME/.nanorc
    else
		cp .nanorc $HOME/.nanorc
	fi

	if [ "$is_root" == "root" ]; then
		cp fxlab-custom.ini /usr/share/mc/skins/.
	else
		sudo cp fxlab-custom.ini /usr/share/mc/skins/.
	fi
	mv $HOME/.config/mc/ini $HOME/.config/mc/ini_backup && cp ini $HOME/.config/mc/ini

	echo "End of script."
	read -p "Do you want delete 'fxlab-custom' repository from this computer? [Y/N]" del_choice

	# DELETE AFTER INSTALATION
	if [ "$del_choice" == "Y" ] || [ "$del_choice" == "y" ]; then
		echo "fxlab-custom will be deleted"
		cd ../
		rm -rf fxlab-custom
		echo "Exiting the script."
		exit 0


	elif [ "$del_choice" == "N" ] || [ "$del_choice" == "n" ]; then
	    cd ../
	    echo "Exiting the script."
	    exit 0

	else
	    echo "Invalid choice. Please enter [Y/N] "

	fi


elif [ "$choice" == "N" ] || [ "$choice" == "n" ]; then
    cd ..
    echo "Exiting the script."
    exit 0
else
    echo "Invalid choice. Please enter [Y/N] "
fi
