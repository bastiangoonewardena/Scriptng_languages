#! /bin/bash

#Correct number to guess
correctGuess=42    #Change this number if you want to chose a diffrent Number

#Copy code from getNumbers.sh // Code taken from the tutorial. 
printError()
{
    echo -e "\033[31mERROR:\033[0m $1"
}

# function getNumber will determine a value between var2($2) and var3($3)
getNumber()
{
    read -p "$1: "
    while (( $REPLY < $2 || $REPLY > $3 )); do
        printError "Input must be between $2 and $3"    #it will repeat until the user has found the correct number 
        read -p "$1: "
    done
    return $REPLY
}

while :; do
    getNumber "Please type a number between 1 and 100" 1 100  #In this instance $2=1 and $3=100
    userInput=$?
    if (( userInput > $correctGuess )); then
        echo "Too High!"
    elif (( userInput < $correctGuess )); then
        echo "Too Low!"
    else
        break
    fi
done

echo "Correct!"