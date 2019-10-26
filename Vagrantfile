# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "windows_10_virtualbox.box"


  #Overriding Default Port 
  config.winrm.username = "vagrant"
  config.winrm.password = "vagrant"

  config.winrm.port = 55986

  config.vm.provision "ansible" do | ansible| 
    ansible.playbook = "ansible/playbook/chocolatey.yml" 
    ansible.verbose = "v"
    ansible.compatibility_mode="2.0"
    ansible.inventory_path="ansible/hosts/"
  end


     vagrant_synced_folder_default_type = ""
end
