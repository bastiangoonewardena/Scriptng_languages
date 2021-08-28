#!/bin/bash

net_info="$(ifconfig)"

#echo "$net_info" | sed '/inet / s/inet/IP Address:/' | sed 's/netmask/Subnet Mask:/'
#echo "$net_info" | sed 's/netmask/Subnet Mask:/'

ipaddressComp=$(echo "$net_info" | sed -n '/inet / {
    s/inet/IP Address:/
    s/netmask/\n\t\t Subnet Mask:/
    s/broadcast/\n\t\t Brodcast Addres:/
    p  
    }')
    # p command exists to print lines that have been processed by sed and the 
    #-n flag is used to not print lines that have not been processed.

#echo "IP addressed of this computer are \n$ipaddressComp"
#formate ouutput of the ipaddress variable. 
echo -e "The Ip Addressed of this computer are as follows : \n$ipaddressComp"