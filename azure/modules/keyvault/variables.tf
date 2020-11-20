
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


variable "kv_resource_group_name" {
  type        = string
  default     = null
  description = "Resource group name"
}


variable "kv_enable_disk_encryption" {
  type        = bool
  default     = true
  description = "Enable disk encryption (true|false)"
}


variable "kv_tenant_id" {
  type        = string
  default     = null
  description = "Network plugin to use for networking (azure|kubenet) (For production should be Azure CNI)"
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
