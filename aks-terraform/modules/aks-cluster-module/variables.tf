variable "aks_cluster_name" {
  description = "The name of the AKS cluster to create"
  type        = string
}

variable "cluster_location" {
  description = "The Azure region where the AKS cluster will be deployed"
  type        = string
  default     = "UK South"
}

variable "managed_identity_id" {
  description = "The Managed Identity ID used to create the cluster"
  type        = string
}

variable "networking_resource_group_name" {
  description = "The name of the Azure Resource Group where the networking resources were provisioned"
  type        = string
}

variable "vnet_id" {
  description = "The ID of the Virtual Network (VNet)"
  type        = string
}

variable "control_plane_subnet_id" {
  description = "The ID of the control plane subnet within the VNet"
  type        = string
}

variable "worker_node_subnet_id" {
  description = "The ID of the worker node subnet within the VNet"
  type        = string
}

variable "aks_nsg_id" {
  description = "The ID of the Network Security Group (NSG)"
  type        = string
}