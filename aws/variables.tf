variable "server_name" {
  type  =   string
  default   = "web-server"
  description = "nombre del servidor en cada instancia creada"
}

variable "availability_zone" {
  type = list(string)
  default = ["us-east-1a"]
}
