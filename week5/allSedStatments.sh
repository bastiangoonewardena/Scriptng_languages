#! /bin/bash

#FIX ME?? 

echo "Welcome to search for All 'sed' statments"
read -p "What is the directory you would like to seach" NameOfDir

echo "1. All sed statements"
grep -r "sed" "$NameOfDir"
exit 0