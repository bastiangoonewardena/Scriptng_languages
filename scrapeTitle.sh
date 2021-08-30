#! /bin/bash

curl=$(which curl)
outfile="outPutFile.txt"
url=https://threatpost.com/feed/  

red='\033[31m'          #bash - red colour code
green='\033[32m'        #bash - green colour code
blue='\033[34m'         #bash - blue colour code
white='\033[0m'         #bash - white colour code



options=("View what are the top security titles:" \
            "eMail these to you:" \
            "Exit Script:"\
            )

function bannerHeadding(){
	echo
    echo -e " ${green} << Security updatates on Threatpost brought to you by $url >> ${white}"
	echo
}

function optionBanner(){
	echo
    echo -e " ${green} << Security updatates on Threatpost brought to you by $url >> ${white}"
    #echo " << Security updatates on Threatpost brought to you by $url >> "
	echo
    #echo "Please select the following options"
	echo "1. View what are the top security titles: "
    echo "2. eMail these to you: "
	echo "3. Exit Script: "
    echo " "
}

#dump webpage function
function dump_webpage() {
        $curl -o $outfile $url
        check_errors
}

#Titles for the webpage
function strip_html_title() {
        curl -o $outfile $url
        #grep "<title>" $outfile | sed 's:<title>Threatpost</title>::g' | sed 's:<title>::g' | sed 's:</title>::g' | sed 's/&#8217;//g' | sed 's/&#8216;//g' > outPutFileAfterStripped.txt
        #grep "<title>" $outfile | sed 's:<title>Threatpost</title>::g' | sed 's:</title>::g' | sed 's/&#8217;//g' | sed 's/&#8216;//g' > outPutFileAfterStripped.txt 
        #grep "<title>" $outfile | sed 's:<title>Threatpost</title>::g' | sed 's:</title>::g' | sed 's/&#8217;//g' | sed 's/&#8216;//g' > outPutFileAfterStripped.txt 
        grep "<title>" $outfile | sed 's:<title>Threatpost</title>::g' | sed 's/&#8217;//g' | sed 's/&#8216;//g' > outPutFileAfterStripped.txt 
        cat outPutFileAfterStripped.txt | titles
        cat outPutFileAfterStripped.txt | titles > finalTitleOutput.txt
}

function titles(){
		awk 'BEGIN {
		print "___________________________________________________________________________________________________________________" ;
		printf("|%-14s|%-100s|\n", "Article Code", "Description") ;	 #table titles with specified widths
		print "___________________________________________________________________________________________________________________" ;
		FS="<title>" ; }					#field seperator of <title> as this was the start of the description of the article
		/<title*>/{printf("|\033[32m%-14s\033[0m|\033[0;34m%-100s\033[0m|\n", NR, substr($0,10, length ($0)-17)); }	#prints row number (article number) description as a sub string. This allowed us to get rid of arbitrary data at the head and the tail of the string
		END {print"___________________________________________________________________________________________________________________"}'
}

function run_menuoptions(){
        bannerHeadding
        #echo " "
        PS3="Please select from one of these options: "
        select menu in "${options[@]}";
        do
             echo -e "\nYou have selected menu option $menu - $REPLY"
              if [ "$REPLY" -eq 1 ]; then     #
	             echo "Loading..............."
                 echo " "
	             dump_webpage
                 strip_html_title
                 echo ""
                 echo ""
                 optionBanner
                 

                     elif [ "$REPLY" -eq 2 ]; then
                            sendEmail
                             echo ""
                             echo ""
                             optionBanner
                           
             else
                   #echo " "
                   echo -e "You have selected to ${red}exit${white} out of program, Good Bye!.."
                   echo " "
                   break;
          fi
done
}

function sendEmail() {
#eMail address validation script is taken from the internet, from stackoverfolw.com
#URL: https://stackoverflow.com/questions/2138701/checking-correctness-of-an-email-address-with-a-regular-expression-in-bash
    regex="^[a-z0-9!#\$%&'*+/=?^_\`{|}~-]+(\.[a-z0-9!#$%&'*+/=?^_\`{|}~-]+)*@([a-z0-9]([a-z0-9-]*[a-z0-9])?\.)+[a-z0-9]([a-z0-9-]*[a-z0-9])?\$"
    read -p "What is your eMail address: " userEmailAddress
        if [[ "$userEmailAddress" =~ $regex ]] ; then
           echo "email has been sent to $userEmailAddress"
           cat finalTitleOutput.txt | mail -s "Security updatates on Threatpost brought to you by $url" $userEmailAddress
           else
          echo "eMail address you have entered is not valid, Please try again."
        fi
}

run_menuoptions