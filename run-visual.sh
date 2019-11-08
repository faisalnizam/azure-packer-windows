#!/bin/bash

source simple_curses.sh

#Then, you must create a "main" function:
main (){

    window "MOTF Creation For Server" "color"
    endwin


#	window "Select Files to Run" "gree" "33%"
#		if [[ -x `which tree` ]]; then
#			append_command "tree -L 2 -C -A ./"
#		else
#			append "Please install tree command"
#		fi 
#	endwin 


    }

#main_loop 1

SURETY="$(osascript -e 'display dialog "Press Local For Local Insatnce and Azure For Cloud Azure ?" buttons {"Local", "Azure"} default button "Local"')"

if [ "$SURETY" = "button returned:Local" ]; then
    echo "1: Crete Local Virtual Machine."
else
    echo "2: Create Azure Virtual Machine."
fi
