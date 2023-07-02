terraform {
  backend "azurerm" {
    resource_group_name  = "infrabase"
    storage_account_name = "demo2tfyd4ra"
    container_name       = "tfstate"
    key                  = "tfstate-dev"
  }
}