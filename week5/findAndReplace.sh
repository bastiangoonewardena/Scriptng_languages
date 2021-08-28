#!/ bin/bash

#Find every echo statement with text in double quotes that ends in an exclamation 
#mark in the guessing game from Week 4, and on those lines, 
#replace the first text that matches 'Correct' to say 'Right' instead.
#First we need a good regex to meet the requirements.
#Use grep to test out some regex until you find one that works.



grep 'echo .*".*!"' ../week4/guessingGame.sh 
     

sed 's/Correct/Right/' ../week4/GuessingGame.sh 
grep 's/echo .* .*!' ../week4/guessingGame.sh


#I coppied the file using cp command to the same folder. 
#new folder name is ../week4/guessingGameBackup.sh

sed '/echo .*".*!"/ s/Correct/Right/' ../week4/guessingGame.sh

#I was intitially thinking of doing this. :FIX ME?
sed '/echo .*".*!"/ s/Correct/Right/' ../week4/guessingGame.sh > ../week4/guessingGameBackup.sh 