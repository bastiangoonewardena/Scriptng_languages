#!/bin/bash 
#This script will ask for a name of the folder and will ask for an output for the new folder that a user would lke to create.       
read -p "Type the name of the folder you would like to create : " folderName  
#Adding the foldername
mkdir "$folderName" 
exit 0

     