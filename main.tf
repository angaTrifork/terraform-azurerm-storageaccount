terraform {
  required_version = ">=1.3.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.43.0"
    }
  }
}

resource "azurerm_storage_account" "sa" {
  account_replication_type = var.environment == "Production" ? "GRS" : "LRS"
  account_tier             = "Standard"
  location                 = var.location
  resource_group_name      = var.resource_group_name
  name                     = var.storage_account_name
  tags = {
    Environment = var.environment
  }
  public_network_access_enabled = false
}
