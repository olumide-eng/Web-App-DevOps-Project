provider "azurerm" {
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}
locals {
  unique_uuid = "25f9ff9d"
}
module "networking" {
  source = "./modules/networking-module"
  providers = {
    azurerm = azurerm
  }
  location           = var.location
  vnet_address_space = var.vnet_address_space
}
module "aks_cluster" {
  source = "./modules/aks-cluster-module"
  providers = {
    azurerm = azurerm
  }
  aks_cluster_name                = "${local.unique_uuid}-aks-cluster"
  cluster_location                = var.location
  managed_identity_id             = var.managed_identity_id
  networking_resource_group_name  = module.networking.networking_resource_group_name
  vnet_id                         = module.networking.vnet_id
  control_plane_subnet_id         = module.networking.control_plane_subnet_id
  worker_node_subnet_id           = module.networking.worker_node_subnet_id
  aks_nsg_id                      = module.networking.aks_nsg_id
}
output "networking_resource_group_name" {
  value = module.networking.networking_resource_group_name
}
output "vnet_id" {
  value = module.networking.vnet_id
}
output "control_plane_subnet_id" {
  value = module.networking.control_plane_subnet_id
}
output "worker_node_subnet_id" {
  value = module.networking.worker_node_subnet_id
}
output "aks_nsg_id" {
  value = module.networking.aks_nsg_id
}
output "aks_cluster_name" {
  value = module.aks_cluster.aks_cluster_name
}
output "aks_cluster_id" {
  value = module.aks_cluster.aks_cluster_id
}
output "aks_kubeconfig" {
  value     = module.aks_cluster.aks_kubeconfig
  sensitive = true
}