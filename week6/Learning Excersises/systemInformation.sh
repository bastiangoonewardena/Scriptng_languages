#! /bin/bash

#Updated from the unit forum - directly 
#User-Jeff ROZENKIEWICZ
#The page he found it - https://www.tuxarena.com/2014/10/collection-of-useful-bash-functions-and-aliases/
#

myinfo() 
{
  printf "CPU: "
  cat /proc/cpuinfo | grep "model name" | head -1 | awk '{ for (i = 4; i <= NF; i++) printf "%s ", $i }'
  printf "\n"

  cat /etc/issue.net | awk '{ printf "OS: %s %s %s %s | " , $1 , $2 , $3 , $4 }'
  uname -a | awk '{ printf "Kernel: %s " , $3 }'
  uname -m | awk '{ printf "%s | " , $1 }'
  printf "\n"
  uptime | awk '{ printf "Uptime: %s %s %s", $3, $4, $5 }' | sed 's/,//g'
  printf "\n"

  echo "Device         Total  Used  Free  Pct MntPoint"
  df -h | grep "/dev/sd"
  df -h | grep "/mnt/"
}

myinfo
echo myinfo
exit 0