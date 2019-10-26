# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "windows_10_virtualbox.box"


  # config.vm.network "forwarded_port", guest: 80, host: 8080
  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  #config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.provision "ansible" do | ansible| 
    ansible.playbook = "ansible/playbook/chocolatey.yml" 
    ansible.verbose = "v"
    ansible.compatibility_mode="2.0"
    ansible.inventory_path="ansible/hosts/"
  end


     vagrant_synced_folder_default_type = ""
end
