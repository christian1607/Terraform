

variable "kv_vault_id" {
  type        = string
  default     = null
  description = "Enable soft delete (true|false)"
}


variable "kv_key_name" {
  type        = string
  default     = "key"
  description = "key name"
}

variable "kv_key_type" {
  type    = string
  default = false
}

variable "kv_key_size" {
  type        = string
  default     = "standard"
  description = "Sku tier (standard|premium)"
}


variable "kv_key_opts" {
  type        = list(string)
  default     = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]
  description = "key options"
}
