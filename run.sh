#! /bin/sh 

echo "Welcome to the MOTF World"
echo ""
echo "Enter 1 Virtual Box and 2 For Azure" 
read USER_OPTION


if [ $USER_OPTION == "1" ]; then 
   
    echo ""
    echo "You Entered 1 : Checking Required Sotware"
    echo "To Run the Following in your Local Environment "
    echo "Following Tools Are Required"

    if [  -x "$(command -v virtualbox )" ]; then 
        echo ""
        echo "1. VirtualBox Found" 
    else
        echo "Please Install Virtuabox"
        exit 
    fi 

    if [ -x "$(command -v vagrant)" ]; then 
        echo ""
        echo "2. Vagrant Found"
    else 
        echo ""
        echo "Please Install Vagrant"
        exit
    fi 

    if [ -x "$(command -v packer)" ]; then 
        echo ""
        echo "3. Packer Found"
    else 
        echo ""
        echo "Packer Not Found" 
        exit
    fi 

    if [ -x "$(command -v az)" ]; then 
        echo ""
        echo "4. Azure CLI Installed"
    else 
        echo ""
        echo "Azure Cli Not Configured"
        exit 
    fi 

    #packer build -only=virtualbox-iso windows_10.json

elif [ $USER_OPTION == "2"  ]; then 
    
    echo "Azure Part is Under Development"

else 
    
    echo "Please select a valid option... Exitting" 

fi 
