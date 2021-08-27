#!/bin/bash
printError()    
{ 
      echo -e "\033[31mERROR:\033[0m $1"    
} 

printError2()    
{ 
      echo -e "\033[31mERROR:$1\033[0m"    
} 


#printError test

#ONLY printError should be in red
printError Test 2 

#Error should be in red
printError2 Test 2 

echo "$1"
     