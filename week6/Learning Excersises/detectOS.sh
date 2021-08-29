#! /bin/bash

#This code was posted by Coling APPLEBY, and I am using it for testing purposes: 

function DetectOS()
{
	if type -t wevtutil &> /dev/null           
	then
		OS=MSWin
	elif type -t scutil &> /dev/null           
	then
		OS=macOS
	else
		OS=Linux
	fi
}
DetectOS
echo $OS
