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
        is_true=1
    else
        echo "Please Install Virtuabox"
        exit 
    fi 

    if [ -x "$(command -v vagrant)" ]; then 
        echo ""
        echo "2. Vagrant Found"
        is_true=2
    else 
        echo ""
        echo "Please Install Vagrant"
        exit
    fi 

    if [ -x "$(command -v packer)" ]; then 
        echo ""
        echo "3. Packer Found"
        is_true=3
    else 
        echo ""
        echo "Packer Not Found" 
        exit
    fi 

    if [ -x "$(command -v az)" ]; then 
        echo ""
        echo "4. Azure CLI Installed"
        is_true=4
    else 
        echo ""
        echo "Azure Cli Not Configured"
        exit 
    fi 

    packer build -only=virtualbox-iso packer/windows.json
    vagrant box add --name WindowsTestBox windows_10_virtualbox.box

elif [ $USER_OPTION == "2"  ]; then 
    
    echo "Azure Part is Under Development"

else 
    
    echo "Please select a valid option... Exitting" 

fi 
