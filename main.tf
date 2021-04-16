resource "azurerm_resource_group" "main" {
  name     = "rg-global-azure-at-${terraform.workspace}"
  location = var.location

  tags = local.tags
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-${terraform.workspace}"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  dns_prefix          = "aksdev"

  default_node_pool {
    name       = "linux"
    node_count = 2
    vm_size    = "Standard_D2_v4"
  }

  identity {
    type = "SystemAssigned"
  }

  addon_profile {
    kube_dashboard {
      enabled = false
    }
  }

}
