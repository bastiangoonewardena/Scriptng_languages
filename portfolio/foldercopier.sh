#!/bin/bash
read -p "Type the name of the folder that you would like to copy: " folderName

#If the name is a valid directory
if [ -d "$folderName" ]; then
	#Copy to a new location
	read -p "type the name of the destination folder: " destinantionFolderName
	cp -r "$folderName" "$destinantionFolderName"
		else
		#If the folder is not there, print error
		echo "Can't locate that folder"
fi
exit 0
