# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "windows_10_virtualbox.box"


  #Overriding Default Port 
  config.winrm.username = "vagrant"
  config.winrm.password = "vagrant"
  config.winrm.port = 55986

 # config.vm.provision "shell", privileged: "true", powershell_elevated_interactive: "true", inline: <<-SHELL
 #         iwr https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1 -UseBasicParsing | iex
 # SHELL

  config.vm.provision "ansible" do | ansible| 
    ansible.playbook = "ansible/playbook/chocolatey.yml" 
    ansible.verbose = "v"
    ansible.compatibility_mode="2.0"
    ansible.inventory_path="ansible/hosts/"
  end


     vagrant_synced_folder_default_type = ""
end
