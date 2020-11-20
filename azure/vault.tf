


data "azurerm_client_config" "current" {}


module "key_vault_resource_group" {
  source = "./modules/resource_group"

  location            = var.location
  project             = var.project
  resource_group_name = "rg-caltamirano-keyvault-002"
  tags                = var.tags

}


module "azure_vnet" {
  source = "./modules/vnet"

  location            = var.location
  resource_group_name = module.key_vault_resource_group.rg_name
  vnet_name           = "vnet-caltamirano-personal-001"
  vnet_address_space  = ["10.0.0.0/16"]
}

module "azure_vnet_subnet_1" {
  source = "./modules/vnet/subnet"

  resource_group_name      = module.key_vault_resource_group.rg_name
  subnet_name              = "sn-caltamirano-personal-001"
  vnet_name                = module.azure_vnet.name
  subnet_address_prefixes  = ["10.0.0.0/24"]
  subnet_service_endpoints = ["Microsoft.KeyVault"]
}

module "azure_vnet_subnet_2" {
  source = "./modules/vnet/subnet"

  resource_group_name      = module.key_vault_resource_group.rg_name
  subnet_name              = "sn-caltamirano-personal-002"
  vnet_name                = module.azure_vnet.name
  subnet_address_prefixes  = ["10.0.1.0/24"]
  subnet_service_endpoints = ["Microsoft.KeyVault"]

}








module "keyvault" {

  source = "./modules/keyvault"

  kv_name                   = var.kv_name
  kv_location               = var.location
  kv_resource_group_name    = module.key_vault_resource_group.rg_name
  kv_enable_disk_encryption = var.kv_enable_disk_encryption
  kv_tenant_id              = data.azurerm_client_config.current.tenant_id
  kv_soft_delete            = var.kv_soft_delete
  kv_retention_days         = var.kv_retention_days
  kv_purge_protection       = var.kv_purge_protection
  kv_sku                    = var.kv_sku
  kv_virtual_network_subnet_ids = [
    module.azure_vnet_subnet_1.id,
    module.azure_vnet_subnet_2.id,
  ]

  kv_ip_rules               = ["179.6.209.83"]
  tags = var.tags

}


module "keyvault_policy_current" {

  source = "./modules/keyvault/policy"

  kv_vault_id                = module.keyvault.id
  kv_tenant_id               = data.azurerm_client_config.current.tenant_id
  kv_object_id               = data.azurerm_client_config.current.object_id
  kv_key_permissions         = ["backup", "create", "decrypt", "delete", "encrypt", "get", "import", "list", "purge", "recover", "restore", "sign", "unwrapKey", "update", "verify", "wrapKey", ]
  kv_secret_permissions      = ["backup", "delete", "get", "list", "purge", "recover", "restore", "set", ]
  kv_certificate_permissions = ["backup", "create", "delete", "deleteissuers", "get", "getissuers", "import", "list", "listissuers", "managecontacts", "manageissuers", "purge", "recover", "restore", "setissuers", "update", ]
  kv_storage_permissions     = ["backup", "delete", "deletesas", "get", "getsas", "list", "listsas", "purge", "recover", "regeneratekey", "restore", "set", "setsas", "update", ]

}

module "keyvault_policy_caltamirano" {

  source = "./modules/keyvault/policy"

  kv_vault_id                = module.keyvault.id
  kv_tenant_id               = data.azurerm_client_config.current.tenant_id
  kv_object_id               = "59ce3fbf-1941-4bec-a183-594c591ac12b"
  kv_key_permissions         = ["backup", "create", "decrypt", "delete", "encrypt", "get", "import", "list", "purge", "recover", "restore", "sign", "unwrapKey", "update", "verify", "wrapKey", ]
  kv_secret_permissions      = ["backup", "delete", "get", "list", "purge", "recover", "restore", "set", ]
  kv_certificate_permissions = ["backup", "create", "delete", "deleteissuers", "get", "getissuers", "import", "list", "listissuers", "managecontacts", "manageissuers", "purge", "recover", "restore", "setissuers", "update", ]
  kv_storage_permissions     = ["backup", "delete", "deletesas", "get", "getsas", "list", "listsas", "purge", "recover", "regeneratekey", "restore", "set", "setsas", "update", ]

}



variable "kv_name" {
  type        = string
  default     = "kv-001"
  description = "Name of KeyVault"
}


variable "kv_location" {
  type        = string
  default     = "East US"
  description = "KeyVault Location"
}


variable "kv_enable_disk_encryption" {
  type        = bool
  default     = true
  description = "Enable disk encryption (true|false)"
}


variable "kv_soft_delete" {
  type        = bool
  default     = true
  description = "Enable soft delete (true|false)"
}


variable "kv_retention_days" {
  type        = number
  default     = 90
  description = "Days of retention"
}

variable "kv_purge_protection" {
  type    = bool
  default = false
}

variable "kv_sku" {
  type        = string
  default     = "standard"
  description = "Sku tier (standard|premium)"
}


variable "tags" {
  type        = map(string)
  default     = { "CreatedBy" : "Terraform" }
  description = "Collections of Tags asociated to the resource"
}



