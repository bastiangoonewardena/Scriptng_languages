#!/bin/bash
#
#Write a script named 'passwordCheck.sh' that accomplishes the following:
#Ask the user to type a secret password (hide that input).
#Check the user’s password against the hash stored in 'secret.txt'.
#If the user’s password is correct, print “Access Granted” and quit with the exit code 0.
#If the user’s password is incorrect print “Access Denied” and quit with the exit code 1.
#

#creating the file "secret.txt"             
touch secret.txt

echo "<<Welcome to password checking system>>"
echo " "
echo "1 - Set the password for the system"
echo "2 - Check access to the system"
echo " "

read -p "Please select either option 1 or 2: " optionSelect
if [ "$optionSelect" -eq 1 ]; then
	echo " "
	read -sp "Enter a password: " userPassword
	echo " "
	#creating the file "secret.txt"             
#	touch secret.txt

	#Password encryption usin sha3sum, and output the restup to secret.txt file.
	#hash3='echo $userPassword | sha3sum'
	echo $userPassword | sha3sum>secret.txt
	echo "Created password is saved in the secret.txt file"
	#cat secret.txt (Code was used for deuggning)
	echo " "


	elif [ "$optionSelect" -eq 2 ]; then
	echo " "
	read -sp "Please enter your password to gain access to the system" userPreviousPassword
	echo " "
	
			#Check the file secret.txt
			hash1="$(cat secret.txt)"
			hash2="$(echo $userPreviousPassword | sha3sum)"

			#FixMe Error (Code was used for debugging)
			#echo $hash1
			#echo $hash2

			if [ "$hash1" =  "$hash2" ]; then
				echo "Password you entered is CORRECT"
				echo "Access Granted"
			    exit 0
	 				else
					echo "Password you entered is WRONG!"
					echo "Access Denied"
					exit 1
			fi




		else
		echo "User option you entered is invalid, please try again later."
		echo "to try again type ./passwordCheck_2.3.sh"
		echo "Good Bye"
fi 

