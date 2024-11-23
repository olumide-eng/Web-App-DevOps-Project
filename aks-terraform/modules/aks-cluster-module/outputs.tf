output "aks_cluster_name" {
  description = "The name of the provisioned AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "aks_cluster_id" {
  description = "The ID of the provisioned AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.id
}

output "aks_kubeconfig" {
  description = "The Kubernetes configuration file of the provisioned AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}