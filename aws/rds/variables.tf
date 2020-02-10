

variable "availability_zone" {
  type = list(string)
  default = ["us-east-1a"]
}


variable "region" {
  type = string
  default = ""
  description = "region del recurso"
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "db_password" {
  type = string
}

variable "db_username" {
  type = string
}

