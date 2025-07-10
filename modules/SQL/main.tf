resource "azurerm_mssql_server" "sqlserver" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password
  
}
resource "azurerm_mssql_database" "sqldb" {
  name                = var.sql_database_name
  server_id       = azurerm_mssql_server.sqlserver.id
  sku_name            = "Basic"
}