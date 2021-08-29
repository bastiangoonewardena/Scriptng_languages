#! /bin/bash

#executes the ipInfo.sh 
#script and uses sed to display only the lines with 'IP Address' on them.

#Follwing command will do all that in one ine of code. 
#ipInfor.sh script is being used and piped it wwith sed command. 
# -n meaning to spress the output. 
# p at the end of script - only the lines with 'IP Address'
./ipInfo.sh | sed -n '/IP Address/ p'


#ipAddress_info="$(./ipInfo.sh)"
#ipaddressDisplay="$(./ipInfo.sh | sed -n '/IP Address/ ')"

#Print out the iP Address of the computer
#echo -e "The Ip Addressed of this computer are as follows : \n$ipaddressDisplay"
exit 0