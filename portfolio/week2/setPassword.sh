#!/bin/bash
read -p "Type a folder name: " folderName
read -s "Please type a password: " secretPassword

mkdir "$folderName"
echo $secretPassword | sha3sum
echo $secretPassword > nano secret.txt
mv secret.txt $folderName/secret.txt
exit 0
