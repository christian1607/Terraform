
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


variable "kv_enabled_for_template_deployment" {
  type        = bool
  default     = false
  description = "whether Azure Resource Manager is permitted to retrieve secrets from the key vault."
}


variable "kv_enabled_for_deployment" {
  type        = bool
  default     = false
  description = "Specifies whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault."
}


variable "kv_enable_rbac_authorization" {
  type        = bool
  default     = true
  description = "Enable RBAC authorization"
}


variable "kv_tenant_id" {
  type        = string
  default     = null
  description = "AAD Tenant Id where vault will be deployed"
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

variable "kv_bypass" {
  type        = string
  default     = "AzureServices"
  description = "Specifies which traffic can bypass the network rules. Possible values are AzureServices and None"
}

variable "kv_default_action" {
  type        = string
  default     = "Deny"
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are Allow and Deny"
}


variable "kv_ip_rules" {
  type        = list(string)
  default     = []
  description = "One or more IP Addresses, or CIDR Blocks which should be able to access the Key Vault."
}


variable "kv_virtual_network_subnet_ids" {
  type        = list(string)
  default     = []
  description = "One or more Subnet ID's which should be able to access this Key Vault."
}


variable "tags" {
  type        = map(string)
  default     = { "CreatedBy" : "Terraform" }
  description = "Collections of Tags asociated to the resource"
}
