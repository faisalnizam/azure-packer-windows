#!/bin/bash

source simple_curses.sh

#Then, you must create a "main" function:
main (){

    window "MOTF Creation For Server" "color"
    endwin

    dialog --yesno "Are you sure you want to partition this disk?" 5 50

#	window "Select Files to Run" "gree" "33%"
#		if [[ -x `which tree` ]]; then
#			append_command "tree -L 2 -C -A ./"
#		else
#			append "Please install tree command"
#		fi 
#	endwin 


    }

#main_loop 1


OUTPUT="/tmp/input.txt"

>$OUTPUT

dialog --title "Enter Your Name" \
--backtitle "MOTF OnBoarding" \
--inputbox "Enter your name " 8 60 2>$OUTPUT

respose=$?

name=$(<$OUTPUT)

#case $respose in
#  0)
#  	sayhello ${name}
#  	;;
#  1)
#  	echo "Cancel pressed."
#  	;;
#  255)
#   echo "[ESC] key pressed."
#esac


SURETY="$(osascript -e 'display dialog "Press Local For Local Insatnce and Azure For Cloud Azure ?" buttons {"Local", "Azure"} default button "Local"')"

if [ "$SURETY" = "button returned:Local" ]; then
    echo "1: Crete Local Virtual Machine."
else
    echo "2: Create Azure Virtual Machine."
fi

osascript -e 'set T to text returned of (display dialog "Subscription ID:" buttons {"Cancel", "OK"} default button "OK" default answer "")'
osascript -e 'set T to text returned of (display dialog "Client ID: " buttons {"Cancel", "OK"} default button "OK" default answer "")'
osascript -e 'set T to text returned of (display dialog "Client Secret: " buttons {"Cancel", "OK"} default button "OK" default answer "")'
osascript -e 'set T to text returned of (display dialog "Tenant ID: " buttons {"Cancel", "OK"} default button "OK" default answer "")'
osascript -e 'set T to text returned of (display dialog "Key To Copy: " buttons {"Cancel", "OK"} default button "OK" default answer "")'
