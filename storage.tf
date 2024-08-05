resource "azurerm_storage_account" "storage" {
  name                     = "${var.company}${var.environment}storage"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = var.environment
    company     = var.company
  }
}