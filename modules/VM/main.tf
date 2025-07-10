resource "azurerm_public_ip" "pip" {
    name = var.public_ip_name
    resource_group_name = var.resource_group_name
    location = var.location
    allocation_method = "Static"
  
}

resource "azurerm_network_interface" "nic" {
    name=var.nicname
    resource_group_name = var.resource_group_name
    location = var.location
    ip_configuration {
        name = "internal"
        subnet_id = var.subnet_id
        private_ip_address_allocation = "Dynamic"
    }
  
}

resource "azurerm_linux_virtual_machine" "vm" {
  name=var.vmname
  resource_group_name = var.resource_group_name
  location = var.location
    size = "Standard_B1s"
    admin_username = var.vmadminusername
    admin_password = var.vmpassword
    network_interface_ids = [azurerm_network_interface.nic.id]
    disable_password_authentication = false

    os_disk {
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }
  source_image_reference {
  publisher = "Canonical"
  offer     = "UbuntuServer"
  sku       = "18_04-lts-gen2"
  version   = "latest"
}



}