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
    echo "" 
    echo  "Enter Subscription ID" 
    read SUBSCRIPTION_ID 

    echo "" 
    echo  "Enter Client ID" 
    read CLIENT_ID 

    echo "" 
    echo  "Enter Client Secret" 
    read CLIENT_SECRET 

    echo "" 
    echo  "Enter Tenant ID" 
    read TENANT_ID 

out="packer build -only=azure-arm -var 'subscription_id=${SUBSCRIPTION_ID}' -var 'client_id=${CLIENT_ID}' -var 'client_secret=${CLIENT_SECRET}' -var 'tenant_id=${TENANT_ID}' packer/windows.json"

echo $out 

echo ""
echo "Running the Above Command" 
$out 

else 
    
    echo "Please select a valid option... Exitting" 

fi 
