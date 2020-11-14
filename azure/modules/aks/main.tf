

resource "azurerm_kubernetes_cluster" "aks" {
  name                    = "aks-terraform-personal-001"
  location                = var.location
  resource_group_name     = var.rg_aks_name
  dns_prefix              = "akscaltamirano"
  kubernetes_version      = var.kubernetes_version
  sku_tier                = var.aks_sku
  private_cluster_enabled = var.private_cluster_enabled
  //api_server_authorized_ip_ranges = ""

  //node_resource_group = azurerm_resource_group.rg_aks.name


  default_node_pool {
    name                  = "npakstf001"
    node_count            = var.node_pool_node_count
    vm_size               = var.node_vm_size
    max_pods              = var.max_pods_per_node
    vnet_subnet_id        = var.vnet_subnet_id
    os_disk_size_gb       = 50
    type                  = "VirtualMachineScaleSets"
    enable_node_public_ip = false
    enable_auto_scaling   = true
    max_count             = 2
    min_count             = 1

  }

  network_profile {
    network_plugin = var.network_plugin
    network_policy    = "azure"
    pod_cidr           = var.network_plugin=="azure"?null:"40.0.0.0/20"
    service_cidr       = "20.0.0.0/20"
    docker_bridge_cidr = "172.0.0.1/20"
    dns_service_ip     = "20.0.0.10"
    load_balancer_sku  = var.load_balancer_sku
  }



  service_principal {
    client_id     = var.service_principal_client_id
    client_secret = var.service_principal_client_secret
  }

  addon_profile {

    //aci_connector_linux {
    //    enabled = false
    // }

    //azure_policy {
    //   enabled = false
    //}

    // http_application_routing {
    //     enabled = false
    // }

    kube_dashboard {
      enabled = false
    }

    // oms_agent {
    //     enabled = false
    // }
  }


  role_based_access_control {
    enabled = true
  }

}


/* resource "azurerm_kubernetes_cluster_node_pool" "nodepool_linux" {

  name                  = "npakslinux"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  node_count            = var.node_pool_node_count
  vm_size               = var.node_vm_size
  max_pods              = var.max_pods_per_node
  os_disk_size_gb       = 50
  enable_node_public_ip = false
  os_type               = "Linux"
  
}

*/

