 terraform {
   

 backend "azurerm" {
    resource_group_name  = "betarg"
    storage_account_name = "backstorage91"
    container_name       = "meristate"
    key                  = "prod.terraform.tfstate"
  }
 }
  provider "azurerm" {
    features {}
    subscription_id ="7de28130-be16-40a2-8ee2-60ad9d430e13"
  }