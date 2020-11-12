variable "location" {
  type        = string
  default     = "web-server"
  description = "Location wich aks will be installed"
}

variable "project" {
  type        = string
  default     = "demo-aks"
  description = "Name of the project"
}


variable "node_pool_node_count" {
  type        = number
  default     = 1
  description = "number of nodes for the aks cluster"
}

variable "max_pods_per_node" {
  type        = number
  default     = 50
  description = "number of pods allowed per node (default: 50)"
}


variable "node_vm_size" {
  type        = string
  default     = "Standard_D2_v2"
  description = "VM size for every aks node"

}

variable "enviroment" {
  type        = string
  default     = "development"
  description = "enviroment"

}

variable "service_principal_client_id" {
  type        = string
  default     = ""
  description = "client id used to create a cluster AKS"
  //https://docs.microsoft.com/en-us/azure/aks/kubernetes-service-principal
}

variable "service_principal_client_secret" {
  type        = string
  default     = ""
  description = "service principal secret to create aks cluster"
  //https://docs.microsoft.com/en-us/azure/aks/kubernetes-service-principal
}

variable "load_balancer_sku" {
  type        = string
  default     = "Basic"
  description = "Load Balancer SKU (Basic|Standard)"
}

variable "network_plugin" {
  type        = string
  default     = "kubenet"
  description = "Network plugin to use for networking (azure|kubenet) (For production should be Azure CNI)"
}

variable "aks_sku" {
  type        = string
  default     = "Free"
  description = "AKS SKU Tier (Free | Paid)"
}

