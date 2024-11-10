provider "azurerm" {
  features {}
}

module "networking" {
  source = "./modules/networking-module"

  location = "UK South"
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