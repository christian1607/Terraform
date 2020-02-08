variable "cloudflare_email" {
    type    =   "string"
    description =  "email de autenticacion a la cuenta de cloudfare"
  
}

variable "cloudflare_api_key" {
    type = "string"
    description = "apikey usado para que terraform pueda acceder al api de cloudfare."
  
}

variable "cloudflare_zone_id" {
  type = "string"
}
