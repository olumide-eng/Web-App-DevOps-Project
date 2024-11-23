terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0.0"
    }
  }
}

locals {
  unique_uuid = "25f9ff9d"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${local.unique_uuid}-aks-cluster"
  location            = var.cluster_location
  resource_group_name = var.networking_resource_group_name
  dns_prefix          = "${local.unique_uuid}-aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"

    vnet_subnet_id = var.worker_node_subnet_id
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [var.managed_identity_id]
  }

  network_profile {
    network_plugin    = "azure"
    network_policy    = "azure"
    load_balancer_sku = "standard"
    outbound_type     = "loadBalancer"
  }

  tags = {
    environment = "dev"
  }
}