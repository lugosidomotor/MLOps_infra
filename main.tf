terraform {
  backend "azurerm" {
    storage_account_name = "PLACEHOLDER"
    container_name       = "PLACEHOLDER"
    key                  = "PLACEHOLDER"
    resource_group_name  = "PLACEHOLDER"
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}