
data "azurerm_client_config" "current" {}


module "keyvault" {

  source = "./modules/keyvault"

  kv_name                            = var.kv_name
  kv_location                        = var.location
  kv_resource_group_name             = module.key_vault_resource_group.rg_name
  kv_enable_disk_encryption          = var.kv_enable_disk_encryption
  kv_tenant_id                       = data.azurerm_client_config.current.tenant_id
  kv_enabled_for_deployment          = true
  kv_enabled_for_template_deployment = true
  kv_enable_rbac_authorization       = false
  kv_soft_delete                     = var.kv_soft_delete
  kv_retention_days                  = var.kv_retention_days
  kv_purge_protection                = var.kv_purge_protection
  kv_sku                             = var.kv_sku
  kv_virtual_network_subnet_ids = [
    module.azure_vnet_subnet_1.id,
    module.azure_vnet_subnet_2.id,
  ]
  kv_ip_rules = ["0.0.0.0/0"]
  tags        = var.tags

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

  kv_vault_id  = module.keyvault.id
  kv_tenant_id = data.azurerm_client_config.current.tenant_id
  kv_object_id               = "59ce3fbf-1941-4bec-a183-594c591ac12b"
  kv_key_permissions         = ["backup", "create", "decrypt", "delete", "encrypt", "get", "import", "list", "purge", "recover", "restore", "sign", "unwrapKey", "update", "verify", "wrapKey", ]
  kv_secret_permissions      = ["backup", "delete", "get", "list", "purge", "recover", "restore", "set", ]
  kv_certificate_permissions = ["backup", "create", "delete", "deleteissuers", "get", "getissuers", "import", "list", "listissuers", "managecontacts", "manageissuers", "purge", "recover", "restore", "setissuers", "update", ]
  kv_storage_permissions     = ["backup", "delete", "deletesas", "get", "getsas", "list", "listsas", "purge", "recover", "regeneratekey", "restore", "set", "setsas", "update", ]

}



module "keyvault_secret_cosmosdb_user" {

  source = "./modules/keyvault/secret"

  kv_vault_id     = module.keyvault.id
  kv_secret_name  = "cosmosdbuser"
  kv_secret_value = "lenkismo"
  depends_on = [module.keyvault_policy_caltamirano]

}

module "keyvault_secret_cosmosdb_password" {

  source = "./modules/keyvault/secret"

  kv_vault_id     = module.keyvault.id
  kv_secret_name  = "cosmosdbpassword"
  kv_secret_value = "lenkismo"
    depends_on = [module.keyvault_policy_caltamirano]

}


module "keyvault_secret_user" {

  source = "./modules/keyvault/secret"

  kv_vault_id     = module.keyvault.id
  kv_secret_name  = "user"
  kv_secret_value = "admin2"
    depends_on = [module.keyvault_policy_caltamirano]

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



