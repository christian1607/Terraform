variable "token" {
  type        = string
  default     = null
  description = "Terraform cloud API TOKEN"
}

variable "tf_repo_token" {
  type        = string
  default     = null
  description = "Terraform Repository oauth Token"
}




variable "service_principal_client_id" {
  type        = string
  default     = null
  description = "Azure Service Principal Client Id"
}

variable "service_principal_client_secret" {
  type        = string
  default     = null
  description = "Azure Service Principal  secret"
}

