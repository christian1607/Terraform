


data "azurerm_client_config" "current" {}


module "key_vault_resource_group" {
  source = "./modules/resource_group"

  location            = var.location
  project             = var.project
  resource_group_name = "rg-caltamirano-keyvault-001"
  tags                = var.tags

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
  tags                      = var.tags

}


module "keyvault_policy" {

  source = "./modules/keyvault/policy"

  kv_vault_id                = module.keyvault.id
  kv_tenant_id               = data.azurerm_client_config.current.tenant_id
  kv_object_id               = data.azurerm_client_config.current.object_id
  kv_key_permissions         = ["backup", "create", "delete", "deleteissuers", "get", "getissuers", "import", "list", "listissuers", "managecontacts", "manageissuers", "purge", "recover", "restore", "setissuers", "update"]
  kv_secret_permissions      = ["backup", "create", "decrypt", "delete", "encrypt", "get", "import", "list", "purge", "recover", "restore", "sign", "unwrapKey", "update", "verify", "wrapKey"]
  kv_certificate_permissions = ["backup", "delete", "get", "list", "purge", "recover", "restore", "set"]
  kv_storage_permissions     = ["backup", "delete", "deletesas", "get", "getsas", "list", "listsas", "purge", "recover", "regeneratekey", "restore", "set", "setsas", "update"]

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



