variable "location" {
  type        = string
  default     = "East US"
  description = "Location wich aks will be installed"
}

variable "resource_group_name" {
  type        = string
  default     = "rg-001"
  description = "Resource group name where the vnet an subnet will be located"
}

variable "vnet_address_space" {
  type        = list(string)
  default     = ["10.0.0.0/16"]
  description = "list of address prefixes fro vnet in CIDR format"
}

variable "subnet_address_prefixes" {
  type        = list(string)
  default     = ["10.0.0.0/24"]
  description = "list of address prefixes for subnets in CIDR format"
}

variable "subnet_name" {
  type        = string
  default     = "sn-001"
  description = "Subnet name"
}
variable "vnet_name" {
  type        = string
  default     = "vnet-001"
  description = "Subnet name"
}

