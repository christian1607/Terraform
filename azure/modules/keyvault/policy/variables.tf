
variable "kv_vault_id" {
  type        = string
  default     = null
  description = "keyvault id to be applied the policy you will create"
}

 variable "kv_tenant_id" {
  type        = string
  default     = null
  description = "Network plugin to use for networking (azure|kubenet) (For production should be Azure CNI)"
}

 variable "kv_object_id" {
  type        = string
  default     = null
  description = "AAD object which the policy will be applied"
}

variable "kv_key_permissions" {
  type        = list(string)
  default     = []
  description = "List of key permissions (backup, create, decrypt, delete, encrypt, get, import, list, purge, recover, restore, sign, unwrapKey, update, verify and wrapKey)"
}


variable "kv_secret_permissions" {
  type        = list(string)
  default     = []
  description = "List of secret permissions (backup, delete, get, list, purge, recover, restore and set)"
}



variable "kv_certificate_permissions" {
  type        = list(string)
  default     = []
  description = "List of certicate permissions (backup, create, delete, deleteissuers, get, getissuers, import, list, listissuers, managecontacts, manageissuers, purge, recover, restore, setissuers and update)"
}



variable "kv_storage_permissions" {
  type        = list(string)
  default     = []
  description = "List of storage permissions (backup, delete, deletesas, get, getsas, list, listsas, purge, recover, regeneratekey, restore, set, setsas and update"
}
