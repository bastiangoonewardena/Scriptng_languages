#! /bin/bash

#Not sure how I am suporse to run it on this directory, 
#The only way I can do this would be rinning the commands as finctions and then excuting them. 
#FIX ME?? 

echo "1. All sed statements"
grep -r "sed" ./"

echo "2. All lines that start with the letter 'm' "
grep -r "^m" "./"

echo "3. All lines that contain three digit numbers"
grep -r "\d\d\d" "./"

echo "4. All echo statements with at least three words"
grep -r "echo[[:space:]]*[[:alpha:]]*[[:space:]]*[[:alpha:]]*[[:space:]]*[[:alpha:]]*" "./"

echo "5. All lines that would make a good password (use your knowledge of cybersecurity to decide what makes a good password)."
grep -Eor "[^[:space:]]{10,}" "./" | grep "[[:lower:]]" | grep "[[:upper:]]" | grep "[[:punct:]]" | grep "[0-9]"
