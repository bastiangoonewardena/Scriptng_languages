#!/bin/bash

 
read -sp "Please enter your password to gain access to the system" userPreviousPassword
echo "     "
echo "    "

#Check the file secret.txt

cat secret.txt -eq  passwordString
$userPreviousPassword | sha3sum -eq userPasswordString

#Testing the Code for outputs
echo "$userPasswordString"
echo "$passwordString"

#
#if [ "$passwordString" = "$userPasswordString" ]; then
#echo "Password you entered is CORRECT.. YEY!.."
#echo "Access Granted $?"
#    else
#     echo "Password you entered is WRONG!....."
#     echo "Access Denied $?"
#fi
#>>
#
