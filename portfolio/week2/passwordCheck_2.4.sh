#!/bin/bash
#
#Write a script named 'passwordCheck.sh' that accomplishes the following:
#Ask the user to type a secret password (hide that input).
#Check the user’s password against the hash stored in 'secret.txt'.
#If the user’s password is correct, print “Access Granted” and quit with the exit code 0.
#If the user’s password is incorrect print “Access Denied” and quit with the exit code 1.
#


#Create secret.txt file
if [ -f secret.txt ]; then
echo "secret.txt file already in the system"
echo " "
	else 
	touch secret.txt
	echo "secret.txt file created."
	echo ""
	echo ""
fi

		echo "<<Welcome to password checking system>>"
		echo " "
		echo "1 - Set the password for the system"
		echo "2 - Check access to the system"
		echo " "
		#Section of options 
			read -p "Please select either option 1 or 2: " optionSelect
			if [ "$optionSelect" -eq 1 ]; then
				echo " "
				read -sp "Enter a password: " userPassword
				echo " "
				#creating the file "secret.txt"             
				#touch secret.txt

				#Password encryption usin sha3sum, and output the restup to secret.txt file.
				echo "$userPassword" | sha3sum > secret.txt
				echo "Created password is saved in the secret.txt file"
				echo " "
				echo " "


				elif [ "$optionSelect" -eq 2 ]; then
				        echo " "
				        read -sp "Please enter your password to gain access to the system" userPreviousPassword
					echo "     "
					echo "    "
	
					#Check the file secret.txt
			
					userOriginalPassword < secret.txt
					#$userPreviousPassword | sha3sum 
					
					#Testing the Code for outputs
					#echo "$userPasswordString"
					#echo "$passwordString"

			
						
						if [ "$userOriginalPassword" =  "$userPreviousPassword | sha3sum " ]; then
						    echo "Password you entered is CORRECT.. YEY!.."
						    echo "Access Granted $?"
	 					       else
							      echo "Password you entered is WRONG!....."
						          echo "Access Denied $?"
						fi



				else
         			  echo "User option you entered is invalid, please try again later."
				  echo "to try again type ./passwordCheck_2.3.sh"
				  echo "Good Bye"
		fi
		

