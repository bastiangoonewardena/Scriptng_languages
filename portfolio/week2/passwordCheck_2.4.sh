#!/bin/bash
#
#Write a script named 'passwordCheck.sh' that accomplishes the following:
#Ask the user to type a secret password (hide that input).
#Check the user’s password against the hash stored in 'secret.txt'.
#If the user’s password is correct, print “Access Granted” and quit with the exit code 0.
#If the user’s password is incorrect print “Access Denied” and quit with the exit code 1.
#

#read -p "Please enter your user name: " userName
#read -sp "Please enter a password: " userPassword

#Test the code if it's working
#echo "Password for $userName is: $userPassword"
#
echo "   "
echo "1. User entering a password to the system" 
echo "2. User wanting to check if the password you entered is in the system" 
echo "   "
echo "   "
read -p "Please select options 1 or 2 : " inPut

if [ "$inPut" -eq 1 ]; then 
	echo "User watning to enter a password, entering the password Menu....."
	echo " "
	elif [ "$inPut" -eq 2 ]; then
	echo "User wanting to check if the password they entered is in the system, Mathcing password Menu...."
	echo " "
		else
		echo "User Doesn't want to do anything, exiting the program...."
		echo " "
fi


exit 0
