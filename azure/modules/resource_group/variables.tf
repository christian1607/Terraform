variable "location" {
  type        = string
  default     = "web-server"
  description = "Location wich aks will be installed"
}

variable "project" {
  type        = string
  default     = "project-aks"
  description = "Name of the project"
}


variable "resource_group_name" {
  type        = string
  default     = "rg-sinnombre-001"
  description = "Name of the resource group to be created"
}


variable "tags" {
  type        = map(string)
  default     = { "Hola" : "dsd", "que" : "dasda" }
  description = "Collections of Tags asociated to the resource group"
}

