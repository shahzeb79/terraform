terraform {
  backend "azurerm" {
    resource_group_name  = "backendrg"
    storage_account_name = "backendtf101shahzeb"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}