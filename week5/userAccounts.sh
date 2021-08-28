#! /bin/bash

#awk satment, 
awk -F: 'BEGIN {
    printf("|%8s%-11s%s|%6s%-10s%s|%6s%-10s%s|%13s%-13s%s|%8s%-8s%s|\n",
        "\033[35m", "Username", "\033[0m",
        "\033[35m", "  UserID", "\033[0m",
        "\033[35m", "GroupID", "\033[0m",
        "\033[35m", "Home", "\033[0m",
        "\033[35m", "Shell", "\033[0m")

    #padded to the left, that is indicated by -
    #%-13s - meaning: Srting with mninmum of 13 charactors padded to the left. 
    printf("| %-13s| %-9s| %-9s| %-20s| %-10s|\n",
        "_____________",
        "__________",
        "__________",
        "____________________",
        "__________")
}

# Filter the data to only show users who have “/bin/bash
/\/bin\/bash$/ {
    printf("| %s%-13s%s| %s%-10s%s| %s%-10s%s| %s%-20s%s| %s%-10s%s|\n",
        "\033[36m", $1, "\033[0m",
        "\033[33m", $3, "\033[0m",
        "\033[33m", $4, "\033[0m",
        "\033[33m", $6, "\033[0m",
        "\033[33m", $7, "\033[0m")
}' /etc/passwd
exit 0
#The script will read the file /etc/passwd
