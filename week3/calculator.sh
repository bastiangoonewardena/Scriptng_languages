#!/bin/bash
echo " "
echo "    <<<------WELCOME TO BASH CALCULATOR------>>>    "
echo " You will be asked to enter 2 numbers, 1st and 2nd" 
echo " Once you have succesfully entered these numbers then you will be asked to enter a few options so you can so some simple mathaatics" 
echo " "
read -p "Please enter 1st number :" val_a
read -p "Please enter 2nd number :" val_b

echo "Select the oparation you would like to do"
echo -e "\033[34m1. Addition : \033[0m"
echo -e "\033[32m2. Subtraction : \033[0m"
echo -e "\033[31m3. Multiplication : \033[0m"
echo -e "\033[35m4. Division : \033[0m"

echo " "
read -p "Please select from options 1,2,3 or 4 : " optionSelect
echo " "
if [ "$optionSelect" -eq 1 ]; then
	echo "You have selected the option 1 - Addition "
    val_c=$(($val_a+$val_b))
    echo "When adding $val_a and $val_b it equals to :"
	echo -e "\033[34m"$val_c"\033[0m"

	elif [ "$optionSelect" -eq 2 ]; then
	echo "You have selected the option 2 - Subtraction "
	val_d=$(($val_a-$val_b))
    echo "When subtracting $val_a from $val_b it equals to :"
	echo -e "\033[32m"$val_d"\033[0m"
		
        elif [ "$optionSelect" -eq 3 ]; then
	    echo "You have selected the option 3 - Multiplication "
	    val_e=$(($val_a*$val_b))
        echo "When multiplying $val_a and $val_b it equals to :"
	    echo -e "\033[31m"$val_e"\033[0m"

			elif [ "$optionSelect" -eq 4 ]; then
	        echo "You have selected the option 4 - Division "
	        val_f=$(($val_a/$val_b))
            echo "When deviding $val_a from $val_b it equals to :"
	        echo -e "\033[35m"$val_f"\033[0m"
            
	else
	echo "User option you entered is invalid, please try again later."
	echo "to try again type ./calculator.sh"
fi 

