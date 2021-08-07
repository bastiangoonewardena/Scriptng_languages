
#!/bin/bash

read -p "Please enter a number :" val_a
read -p "Please enter a number :" val_b

# -eq demonstration
if [ $val_a -eq $val_b ]; then
	echo "value a is the same as value b"
		else
		echo "value a and b is diffrent"
fi 
exit 0
