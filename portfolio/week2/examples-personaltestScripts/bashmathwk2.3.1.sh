#!/bin/bash
#UV Indesx recomendead Calculator

read -p "Please enter the UV Index number (0 - 11)" uvIndexValue
if [ "$uvIndexValue" -le 2 ]; then
	echo "Minimal UV protection is required"
	elif [[ "$uvIndexValue" -ge 3 ]] && [[ "$uvIndexValue" -le 7 ]]; then
		echo "UV Level is Modret to High, hence standard protection is required"
		elif [[ "$uvIndexValue" -ge 8 ]] && [[ "$uvIndexValue" -le 11 ]]; then
		echo "UV Leve is Very High, Maximum protection is required "
			else
			echo "Please enter a correct UV Value, value should be between 0 - 11 "
	fi
exit 0
