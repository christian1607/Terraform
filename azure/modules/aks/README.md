Modulo para aprovisionar un cluster AKS en azure


## Required Variables

- location: Location of your AKS (Default: East US)
- project: project name    (Default: Terraform Azure)
- node_pool_node_count  (Default: 2)
- node_vm_size                (Default:  Standard_D2_v2)   
- max_pods_per_node              (Default:  100)   
- enviroment                     (Default:  development)   
- service_principal_client_id     (Default:  null)
- service_principal_client_secret  (Default:  null)
- load_balancer_sku        (Default:  Standard)       = "Standard"
- network_plugin           (Default:  kubenet)       = "kubenet"
- aks_sku                 (Default:  Free)        = "Free"



## Outputs

- client_certificate
- kube_config