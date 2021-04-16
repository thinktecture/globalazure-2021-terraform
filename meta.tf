provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 2.55.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "globalazureat"
    use_azuread_auth     = true
    container_name       = "remote-state"
    key                  = "globalazure.tfstate"
  }
}
