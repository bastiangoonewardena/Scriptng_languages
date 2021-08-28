#!/bin/bash 
      
echo "Google Server IPs:" 

#awk '{    
#    print $1   
#}' input.txt 
     

#Make the output more pretty>>

 awk 'BEGIN {
    FS=":";
    print "________________________________________";
    print "| \033[34mServer Type\033[0m  | \033[34m   IP             \033[0m    |";
}
{
    printf("| \033[33m%-11s\033[0m  |  \033[35m%-14s\033[0m       |\n", $1, $2);
}
END {
    print("________________________________________");
}' input.txt    