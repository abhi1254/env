variable "sql_server_name" {}
variable "resource_group_name" {}
variable "location" {}
variable "admin_username" {}    
variable "admin_password" {
    sensitive = true
}
variable "sql_database_name" {}



