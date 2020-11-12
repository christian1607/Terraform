
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.35.0"
    }
  }
}


provider "azurerm" {
    
  environment = "public"
  features {}

}

module "aks" {
  source                          = "./modules/aks"
  location                        = var.location
  project                         = var.project
  node_pool_node_count            = var.node_pool_node_count
  node_vm_size                    = var.node_vm_size
  max_pods_per_node               = var.max_pods_per_node
  enviroment                      = var.enviroment
  service_principal_client_id     = var.service_principal_client_id
  service_principal_client_secret = var.service_principal_client_secret
  load_balancer_sku               = var.load_balancer_sku
  network_plugin                  = var.network_plugin
  aks_sku                         = var.aks_sku

}