#!/bin/bash
echo " "
read -p "Type a folder name: " folderName
read -sp "Please type a password: " secretPassword
echo " "
mkdir "$folderName"
touch "$folderName/secret.txt"

echo ""
echo "Folder Name:  $folderName created"
echo " "

#encrypt the password
echo "$secretPassword" | sha3sum>$folderName/secret.txt
echo "Encrypted password has been added to $folderName/secret.txt"
echo " "
echo " "

#Enter Option to viwe the password:
read -p "If you like to view the created password, please press 1: " optionOne
if [ "$optionOne" -eq 1 ]; then
	echo "The saved password is: " 
	cat $folderName/secret.txt
		else
		echo "Please, Enter a correct input, exiting the program."
fi
exit 0
