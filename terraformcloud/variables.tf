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


variable "tf_repo_name" {
  type        = string
  default     = null
  description = "Terraform Repository Provider name"
}

variable "tf_workspace" {
  type        = string
  default     = null
  description = "Terraform Workspace name"
}

variable "tf_organization" {
  type        = string
  default     = null
  description = "Terraform cloud Organization name"
}

variable "tf_path_directory" {
  type        = string
  default     = null
  description = "Relative path where terraform runs"
}


variable "arm_suscription_id" {
  type        = string
  default     = null
}

variable "arm_tenant_id" {
  type        = string
  default     = null
}

variable "arm_client_secret" {
  type        = string
  default     = null
}

variable "arm_client_id" {
  type        = string
  default     = null
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

