module "virtual_network" {
  source              = "../../modules/network"
    vnname              = var.vnname
    resource_group_name = var.resource_group_name
    location            = var.location
    subnetname          = var.subnetname
    
}
module "sql" {
  source              = "../../modules/SQL"
  sql_server_name     = var.sql_server_name
  resource_group_name = var.resource_group_name
  location            = var.location
  admin_username      = data.azurerm_key_vault_secret.sqlusername.value
  admin_password      = data.azurerm_key_vault_secret.sqlpassword.value
  sql_database_name   = var.sql_database_name
  depends_on = [ module.virtual_network ]
  
}
module "vm" {
  source              = "../../modules/VM"
  nicname             = var.nicname
  resource_group_name = var.resource_group_name
  location            = var.location
  vmname              = var.vmname
  public_ip_name      = var.public_ip_name
  subnet_id           = module.virtual_network.subnet_id
  vmadminusername     = data.azurerm_key_vault_secret.VMAdminUsername.value
  vmpassword          = data.azurerm_key_vault_secret.VMAdminPassword.value
  depends_on = [ module.virtual_network ]
}