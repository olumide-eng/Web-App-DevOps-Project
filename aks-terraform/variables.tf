variable "location" {
  description = "The Azure region where the networking resources will be deployed"
  type        = string
  default     = "UK South"
}

variable "vnet_address_space" {
  description = "The address space for the Virtual Network (VNet)"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subscription_id" {
  description = "The Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "The Azure Tenant ID"
  type        = string
}

variable "client_id" {
  description = "The Client ID for the service principal used to authenticate with Azure"
  type        = string
}

variable "client_secret" {
  description = "The Client Secret for the service principal used to authenticate with Azure"
  type        = string
  sensitive   = true
}

variable "managed_identity_id" {
  description = "The Managed Identity ID used for creating the AKS cluster"
  type        = string
}