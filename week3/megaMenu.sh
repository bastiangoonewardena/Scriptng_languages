#! /bin/bash

#Location of the file needs to be changed according to the location you will save the file to. 
#Curent location of my fie is ~/Documents/Masters - ECU/CYB6004_ScriptingLanguages/Assignment3_Portfolio/Scripts/portfolio/Week2 and week3 folders. 

#Start of the menu, The options of the menu, 
#If you want to run this then you have to change these to your running directory. 
#How to do this: 
#
#My working directory is ../week2 and ../week3
#
#

menuList=(
    "../week2/folderMaker.sh::Create a folder" \
    "../week2/folderCopier.sh::Copy a folder" \
    "../week2/setPassword.sh::Set a password" \
    "../week3/calculator.sh::Calculator" \
    "../week3/megaFolderMaker.sh::Create Week Folders" \
    "../week3/filenames.sh:filenames.txt:Check Filenames" \
    "../week3/internetDownloader.sh::Download a File" \
)

#FIX me I have changed the working directories, as I have gained knowladge I realise that I don't need to enter the full path, However decided to leave the comments to you can see my progress. 
#menuList=(
#    "$HOME/Documents/Masters - ECU/CYB6004_ScriptingLanguages/Assignment3_Portfolio/Scripts/portfolio/week2/folderMaker.sh::Create a folder" \
#    "$HOME/Documents/Masters - ECU/CYB6004_ScriptingLanguages/Assignment3_Portfolio/Scripts/portfolio/week2/folderCopier.sh::Copy a folder" \
#    "$HOME/Documents/Masters - ECU/CYB6004_ScriptingLanguages/Assignment3_Portfolio/Scripts/portfolio/week2/setPassword.sh::Set a password" \
#    "$HOME/Documents/Masters - ECU/CYB6004_ScriptingLanguages/Assignment3_Portfolio/Scripts/portfolio/week3/calculator.sh::Calculator" \
#    "$HOME/Documents/Masters - ECU/CYB6004_ScriptingLanguages/Assignment3_Portfolio/Scripts/portfolio/week3/megaFolderMaker.sh::Create Week Folders" \
#    "$HOME/Documents/Masters - ECU/CYB6004_ScriptingLanguages/Assignment3_Portfolio/Scripts/portfolio/week3/filenames.sh:filenames.txt:Check Filenames" \
#    "$HOME/Documents/Masters - ECU/CYB6004_ScriptingLanguages/Assignment3_Portfolio/Scripts/portfolio/week3/internetDownloader.sh::Download a File" \
#)

#Colour scheam for the script
red='\033[31m'          #bash - red colour code
green='\033[32m'        #bash - green colour code
blue='\033[34m'         #bash - blue colour code
white='\033[0m'         #bash - white colour code

#Creating the megaMenu function
megaMenuList() 
 {
    local menuListFileDirectory=$(dirname "$1")
    local menuListFileName=$(basename "$1")
    local return_Val=0
    shift 

    local localHash=$(pwd)

    if cd "$menuListFileDirectory"; 
        then
            "./$menuListFileName" "$@"
            return_Val=$?
            cd "$localHash"
            return $return_Val
        else
            echo "Could not change directory to $menuListFileDirectory"
            return 1
    fi
}

# Checking for the corect user,
#megaMenuList "$HOME/Documents/Masters - ECU/CYB6004_ScriptingLanguages/Assignment3_Portfolio/Scripts/portfolio/week2/PasswordCheck.sh"
#Check if the passwords are matchig, this is the script that is in week2. 
megaMenuList "../week2/PasswordCheck.sh"
if [[ $? -ne 0 ]]; then
    exit 1
fi

echo " "
echo -e "${green} Select an option: " #Display the menu options

echo " "

#Once the user is authenticated with the secret.txt file hash vale, user given access to the mega menu. 
# Display Menu in blue colour.
echo -en "$blue" 
for scriptIndex in "${!menuList[@]}"; do
    scriptPath=$(echo "${menuList[$scriptIndex]}" | cut -f1 -d:)
 #   scriptDescription= echo "${menuList[$scriptIndex]}" | cut -f3 -d: #FIX ME?? 
    scriptDescription=$(echo "${menuList[$scriptIndex]}" | cut -f3 -d:)
    printf "%2d. %s\n" "$(( $scriptIndex + 1 ))" "$scriptDescription"
done

# exit Menu option in white/No colour
echo -en "$white"
printf "%2d. %s\n" "$(( ${#menuList[@]} + 1 ))" "Exit"    
echo " "

# starting of the loop for Menu list options
while :; do

#read -p "${green}Enter your option:${white} " option
#FIX ME?? 26.08.21

    read -p "Please enter your option: " option
      if [[ "$option" =~ ^[0-9]+$ ]]; then
            # Checking if option (int) in that range FIX ME??
            if (( option >= 1 )) && (( option <= ${#menuList[@]} )); then
               break
           elif (( option == ${#menuList[@]} + 1 )); then
              echo "You have succsesfully exited the Mega Menu."
              exit 0   #Exit polite option - 0 : NO Errors
          else
               echo "Please enter an option withing 1 -8, if you press 8 you will be able to exit the Mega Menu."
           fi
      else
         echo "Enter your option, please "
      fi
done


runIndex=$((option - 1))

#megaMenuList "$(echo "$menuList[$runIndex]}" | cut -f1 -d:)" "$(echo "${menuList[$runIndex]" | cut -f2 -d:)" #FIX ME??
#megaMenuList "$(echo "${menuList[$runIndex}" | cut -f1 -d: $(echo "${menuList[$runIndex]} | cut -f2 -d:)"  #FIX ME?? - 
megaMenuList "$(echo "${menuList[$runIndex]}" | cut -f1 -d:)" "$(echo "${menuList[$runIndex]}" | cut -f2 -d:)"

echo -en "$white" #Menu finishes with nutral colour
exit 0