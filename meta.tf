provider "azurerm" {
  features {}
}

locals {
  default_tags = {
    "com.globalazure.session"     = "Terraform"
    "com.globalazure.environment" = "development"
  }

  tags = merge(local.default_tags, var.custom_tags)
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
