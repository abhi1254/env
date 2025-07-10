resource "azurerm_virtual_network" "VN" {
    name= var.vnname
    address_space = ["10.0.0.0/16"]
    resource_group_name = var.resource_group_name
    location= var.location
  
}

resource "azurerm_subnet" "subnet" {
    name = var.subnetname
    resource_group_name = var.resource_group_name
    virtual_network_name = var.vnname
    address_prefixes = ["10.0.1.0/24"]
    depends_on = [ azurerm_virtual_network.VN ]
  
}