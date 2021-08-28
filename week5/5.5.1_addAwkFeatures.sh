#! /bin/bash

#This is the same script as it's in wk 5.5.1 excersise, 
#this was created for testing and leearning purposes.

awk '
BEGIN {
    print "this is the start"
}
/[[:digit:]]/ {
    print "this line contains a number:\n", $0
}
/something/ {
    print "this line contains something:\n", $0
}
{
    print "this is a line:\n", $0
}
END{
    print "goodbye"
}
' ./input.txt
