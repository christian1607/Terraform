terraform {
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.22.0"
    }
  }
}

provider "tfe" {
  token = var.token
}

resource "tfe_workspace" "azure" {
  name              = var.tf_workspace
  organization      = var.tf_organization
  auto_apply        = false
  working_directory = var.tf_path_directory

  vcs_repo {
    identifier     = var.tf_repo_name
    branch         = "master"
    oauth_token_id = var.tf_repo_token
  }

}


resource "tfe_variable" "location" {
  key          = "location"
  value        = "East US"
  category     = "terraform"
  workspace_id = tfe_workspace.azure.id
  description  = "location for aks"
}


resource "tfe_variable" "project" {
  key          = "project"
  value        = "Terraform Azure"
  category     = "terraform"
  workspace_id = tfe_workspace.azure.id
  description  = "project name"
}


resource "tfe_variable" "node_pool_node_count" {
  key          = "node_pool_node_count"
  value        = 2
  category     = "terraform"
  workspace_id = tfe_workspace.azure.id
  description  = "count nodes for aks"
}

resource "tfe_variable" "node_vm_size" {
  key          = "node_vm_size"
  value        = "Standard_D2_v2"
  category     = "terraform"
  workspace_id = tfe_workspace.azure.id
  description  = "node vm size"
}

resource "tfe_variable" "max_pods_per_node" {
  key          = "max_pods_per_node"
  value        = "100"
  category     = "terraform"
  workspace_id = tfe_workspace.azure.id
  description  = "max pods per node"
}

resource "tfe_variable" "enviroment" {
  key          = "enviroment"
  value        = "development"
  category     = "terraform"
  workspace_id = tfe_workspace.azure.id
  description  = "environment"
}

resource "tfe_variable" "service_principal_client_id" {
  key          = "service_principal_client_id"
  value        = var.service_principal_client_id
  category     = "terraform"
  sensitive    = true
  workspace_id = tfe_workspace.azure.id
  description  = "aks cliente id"
}

resource "tfe_variable" "service_principal_client_secret" {
  key       = "service_principal_client_secret"
  value     = var.service_principal_client_secret
  category  = "terraform"
  sensitive = true
  workspace_id = tfe_workspace.azure.id
  description  = "aks cliente secret"
}

resource "tfe_variable" "load_balancer_sku" {
  key          = "load_balancer_sku"
  value        = "Standard"
  category     = "terraform"
  workspace_id = tfe_workspace.azure.id
  description  = "a useful description"
}

resource "tfe_variable" "network_plugin" {
  key          = "network_plugin"
  value        = "azure"
  category     = "terraform"
  workspace_id = tfe_workspace.azure.id
  description  = "type of network plugin (azure|kubenet)"
}

resource "tfe_variable" "aks_sku" {
  key          = "aks_sku"
  value        = "Free"
  category     = "terraform"
  workspace_id = tfe_workspace.azure.id
  description  = "Aks SKU (Free|Paid)"
}

resource "tfe_variable" "aks_private_cluster_enabled" {
  key          = "aks_private_cluster_enabled"
  value        = false
  category     = "terraform"
  workspace_id = tfe_workspace.azure.id
  description  = "Whether the aks apiserver is private or public (Default: true)"
}


resource "tfe_variable" "vnet_name" {
  key          = "vnet_name"
  value        = "vnet-aks-personal-001"
  category     = "terraform"
  workspace_id = tfe_workspace.azure.id
}

resource "tfe_variable" "subnet_name" {
  key          = "subnet_name"
  value        = "sn-aks-personal-001"
  category     = "terraform"
  workspace_id = tfe_workspace.azure.id
  description  = "Aks SKU (Free|Paid)"
}


resource "tfe_variable" "resources_group_name" {
  key          = "resources_group_name"
  value        = "rg-terraform-personal-001"
  category     = "terraform"
  workspace_id = tfe_workspace.azure.id
  description  = "resource group name"
}

resource "tfe_variable" "tags" {
  key          = "tags"
  value        = {
    Project = "Azure Terraform - caltamirano" 
    CostCenter = "caltamirano" 
    Owner = "Christian Altamirano" 
    Suscription = "Personal"
  }
  hcl          = true
  category     = "terraform"
  workspace_id = tfe_workspace.azure.id
}




resource "tfe_variable" "arm_client_id" {
  key          = "ARM_CLIENT_ID"
  value        = var.arm_client_id
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.azure.id
  description  = "ARM client ID for terraform cli"
}


resource "tfe_variable" "arm_client_secret" {
  key          = "ARM_CLIENT_SECRET"
  value        = var.arm_client_secret
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.azure.id
  description  = "ARM secret ID for terraform cli"
}

resource "tfe_variable" "arm_tenant_id" {
  key          = "ARM_TENANT_ID"
  value        = var.arm_tenant_id
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.azure.id
  description  = "ARM tenant for terraform cli"
}


resource "tfe_variable" "arm_suscription_id" {
  key          = "ARM_SUBSCRIPTION_ID"
  value        = var.arm_suscription_id
  category     = "env"
  sensitive    = true
  workspace_id = tfe_workspace.azure.id
  description  = "ARM suscription ID for terraform cli"
}
