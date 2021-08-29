#! /bin/bash


#creating the file "secret.txt"             
touch secret.txt

#echo will print to print the menu. and the banner. 
echo "<<Welcome to password checking system>>"
echo " "
echo "1 - Set the password for the system"
echo "2 - Check access to the system"
echo " "

#User input will be read, and stored as $optionSelect.
read -p "Please select either option 1 or 2: " optionSelect
if [ "$optionSelect" -eq 1 ]; then     #Stating the basic if statment, if option user entered is equal to 1, then do the following.
	echo " "
	read -sp "Enter a password: " userPassword
	echo " "
	#creating the file "secret.txt"             
#	touch secret.txt #FIXME - Changed the location of careating the file to the top of the script. 

	#Password encryption usin sha3sum, and output the restup to secret.txt file.
	#hash3='echo $userPassword | sha3sum'
	echo $userPassword | sha3sum>secret.txt
	echo "Created password is saved in the secret.txt file"
	#cat secret.txt (Code was used for deuggning)
	echo " "

    #else statment, if the option equals 2. 
	elif [ "$optionSelect" -eq 2 ]; then
	echo " "
	read -sp "Please enter your password to gain access to the system" userPreviousPassword
	echo " "
	
			#Check the file secret.txt
			hash1="$(cat secret.txt)"    #hash1 - output of the file secret.tex
			hash2="$(echo $userPreviousPassword | sha3sum)"    #hash2 - output of the string and putting it to the sha3sum hash value.

			#FixMe Error (Code was used for debugging)
			#echo $hash1
			#echo $hash2

			if [ "$hash1" =  "$hash2" ]; then    #Checking to see the 2 hasgh values are equal, if so what happens, and else is if not. 
				echo "Password you entered is CORRECT"
				echo "Access Granted"
			    exit 0
	 				else
					echo "Password you entered is WRONG!"
					echo "Access Denied"
					exit 1
			fi


		else
		#Final Banner at the end of the script. 
		echo "User option you entered is invalid, please try again later."
		echo "to try again type ./passwordCheck_2.3.sh"
		echo "Good Bye"
fi 

