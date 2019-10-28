
# Create virtual network
resource "azurerm_virtual_network" "motfnetwork" {
    name                = "motfVnet"
    address_space       = ["10.0.0.0/16"]
    location            = "eastus"
    resource_group_name = motfImageResGroup

    tags = {
        environment = "MOTF Network"
    }
}

# Create subnet
resource "azurerm_subnet" "motfsubnet" {
    name                 = "motfSubnet"
    resource_group_name  = motfImageResGroup
    virtual_network_name = azurerm_virtual_network.motfnetwork.name
    address_prefix       = "10.0.1.0/24"
}

# Create public IPs
resource "azurerm_public_ip" "motfpublicip" {
    name                         = "motfPublicIP"
    location                     = "eastus"
    resource_group_name          = motfImageResGroup
    allocation_method            = "Dynamic"

    tags = {
        environment = "MOTF PublicIP"
    }
}

# Create Network Security Group and rule
resource "azurerm_network_security_group" "motfterraformnsg" {
    name                = "motfNetworkSecurityGroup"
    location            = "eastus"
    resource_group_name = motfImageResGroup

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags = {
        environment = "Motf Security Group"
    }
}


resource "azurerm_network_security_rule" "rdp" {
  name                        = "rdp"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = "motfImageResGroup"
  network_security_group_name = "${azurerm_network_security_group.motfterraformnsg.name}"
}


resource "azurerm_network_interface" "motfterraformnic" {
    name                      = "motfNIC"
    location                  = "eastus"
    resource_group_name       = "motfImageResGroup"
    network_security_group_id = azurerm_network_security_group.motfterraformnsg.id

    ip_configuration {
        name                          = "motfNicConfiguration"
        subnet_id                     = azurerm_subnet.motfsubnet.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.motfpublicip.id
    }

    tags = {
        environment = "MOTF NIC"
    }
}

resource "azurerm_storage_account" "motfstorageaccount" {
    name                        = "diag${random_id.randomId.hex}"
    resource_group_name         = "motfImageResGroup"
    location                    = "eastus"
    account_tier                = "Standard"
    account_replication_type    = "LRS"

    tags = {
        environment = "Terraform Demo"
    }
}


resource "azurerm_image" "motfVM" {
  name                = "motfWindowsImage"
  location            = "eastus"
  resource_group_name = "motfImageResGroup"

  os_disk {
    os_type  = "Windows"
    os_state = "Generalized"
    blob_uri = ""
    size_gb  = 30
  }
}



resource "azurerm_virtual_machine" "vm" {
  name                  = "motfNewMachine"
  location              = "eastus"
  resource_group_name   = "${azurerm_resource_group.motfImageResGroup.name}"
  vm_size               = "Standard_DS1_v2"
  network_interface_ids = ["${azurerm_network_interface.motfterraformnic.id}"]

  storage_os_disk {
    name          = "motfNewMachine-osdisk1"
    image_uri     = "${var.image_uri}"
    vhd_uri       = "https://${var.storage_account_name}.blob.core.windows.net/vhds/${var.hostname}-osdisk.vhd"
    os_type       = "${var.os_type}"
    caching       = "ReadWrite"
    create_option = "FromImage"
  }

  os_profile {
    computer_name  = "${var.hostname}"
    admin_username = "${var.admin_username}"
    admin_password = "${var.admin_password}"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}


resource "azurerm_virtual_machine" "motfterraformvm" {
    name                  = "motfVM"
    location              = "eastus"
    resource_group_name   = motfImageResGroup
    vm_size               = "Standard_DS1_v2"

    storage_os_disk {
        name              = "motfOsDisk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04.0-LTS"
        version   = "latest"
    }

    os_profile {
        computer_name  = "motfvm"
        admin_username = "azureuser"
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path     = "/home/azureuser/.ssh/authorized_keys"
            key_data = "ssh-rsa AAAAB3Nz{snip}hwhqT9h"
        }
    }

    boot_diagnostics {
        enabled = "true"
        storage_uri = azurerm_storage_account.motfstorageaccount.primary_blob_endpoint
    }

    tags = {
        environment = "Terraform Demo"
    }
}
