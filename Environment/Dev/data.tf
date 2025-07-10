data "azurerm_key_vault" "keyvaultmain" {
  name                = "MyKeyVault09"
  resource_group_name = "betarg"
}
data "azurerm_key_vault_secret" "sqlusername" {
  name         = "sqlusername"
  key_vault_id = data.azurerm_key_vault.keyvaultmain.id
}
data "azurerm_key_vault_secret" "sqlpassword" {
  name         = "sqlpassword"
  key_vault_id = data.azurerm_key_vault.keyvaultmain.id
}

data "azurerm_key_vault_secret" "VMAdminUsername" {
  name         = "vmusername"
  key_vault_id = data.azurerm_key_vault.keyvaultmain.id
}
data "azurerm_key_vault_secret" "VMAdminPassword" {
  name         = "VMpassword"
  key_vault_id = data.azurerm_key_vault.keyvaultmain.id
}