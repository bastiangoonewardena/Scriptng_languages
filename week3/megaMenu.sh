#! /bin/bash

scriptList=(
    "$HOME/Documents/Masters - ECU/CYB6004_ScriptingLanguages/Assignment3_Portfolio/Scripts/portfolio/week2/folderMaker.sh::Create a folder" \
    "$HOME/Documents/Masters - ECU/CYB6004_ScriptingLanguages/Assignment3_Portfolio/Scripts/portfolio/week2/folderCopier.sh::Copy a folder" \
    "$HOME/Documents/Masters - ECU/CYB6004_ScriptingLanguages/Assignment3_Portfolio/Scripts/portfolio/week2/setPassword.sh::Set a password" \
    "$HOME/Documents/Masters - ECU/CYB6004_ScriptingLanguages/Assignment3_Portfolio/Scripts/portfolio/week3/calculator.sh::Calculator" \
    "$HOME/Documents/Masters - ECU/CYB6004_ScriptingLanguages/Assignment3_Portfolio/Scripts/portfolio/week3/megaFolderMaker.sh::Create Week Folders" \
    "$HOME/Documents/Masters - ECU/CYB6004_ScriptingLanguages/Assignment3_Portfolio/Scripts/portfolio/week3/filenames.sh:filenames.txt:Check Filenames" \
    "$HOME/Documents/Masters - ECU/CYB6004_ScriptingLanguages/Assignment3_Portfolio/Scripts/portfolio/week3/internetDownloader.sh::Download a File" \
)

# Define common colour escape sequences
black='\033[30m'
red='\033[31m'
green='\033[32m'
brown='\033[33m'
blue='\033[34m'
purple='\033[35m'
cyan='\033[36m'
grey='\033[37m'
bold='\033[1m'
resetColour='\033[0m'


runScript() {
    local scriptDir=$(dirname "$1")
    local scriptName=$(basename "$1")
    local returnValue=0
    shift

    local BACK=$(pwd)

    if cd "$scriptDir"; then
        "./$scriptName" "$@"
        returnValue=$?
        cd "$BACK"
        return $returnValue
    else
        echo "Could not change directory to $scriptDir"
        return 1
    fi
}

# Authenticate the user
runScript "$HOME/Documents/Masters - ECU/CYB6004_ScriptingLanguages/Assignment3_Portfolio/Scripts/portfolio/scripts/portfolio/week2/PasswordCheck.sh"
if [[ $? -ne 0 ]]; then
    exit 1
fi

# Print the menu
echo -e "${purple}Select an option:"

# Iterate through each script in the scriptList array. Use printf rather than echo for greater flexibility
# and control over formatting.
echo -en "$blue"
for scriptIndex in "${!scriptList[@]}"; do
    scriptPath=$(echo "${scriptList[$scriptIndex]}" | cut -f1 -d:)
    scriptDescription=$(echo "${scriptList[$scriptIndex]}" | cut -f3 -d:)
    printf "%2d. %s\n" "$(( $scriptIndex + 1 ))" "$scriptDescription"
done
echo -en "$resetColour"
printf "%2d. %s\n" "$(( ${#scriptList[@]} + 1 ))" "Exit"

# Keep looping until we get a valid choice from the user. Check for both a valid integer
# and for an integer in the required range.
while :; do
    read -p "Enter your choice: " choice

    if [[ "$choice" =~ ^[0-9]+$ ]]; then
        # choice is an integer. Checking if it's in range
        if (( choice >= 1 )) && (( choice <= ${#scriptList[@]} )); then
            break
        elif (( choice == ${#scriptList[@]} + 1 )); then
            echo "Finished."
            exit 0
        else
            echo "Your choice was out of range."
        fi
    else
        echo "Please enter a number for your choice"
    fi
done

# If we get to this part of the program, we have a valid choice. Due to the choices starting at 1, but arrays
# starting at 0, we need to subtract one from the choice to derive the correct array index.
indexToRun=$((choice - 1))

# Run the script as given in the scriptList array. We need the first and second fields in the scriptList string, being
# the full program path name and optional arguements.
runScript "$(echo "${scriptList[$indexToRun]}" | cut -f1 -d:)" "$(echo "${scriptList[$indexToRun]}" | cut -f2 -d:)"

# Capture the return code of the script for exiting the program.
returnCode=$?

# Reset colours before exiting
echo -en "$resetColour"

# Use the return code captured earlier to exit the program with.
exit $returnCode