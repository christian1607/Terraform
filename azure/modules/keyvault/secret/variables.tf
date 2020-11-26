
variable "kv_vault_id" {
  type        = string
  default     = null
  description = "keyvault id to be applied the secret you will create"
}


variable "kv_secret_value" {
  type        = string
  default     = null
  description = "secret value"
}

variable "kv_secret_name" {
  type        = string
  default     = null
  description = "secret name"
}

