
terraform {
  required_version = "~>0.13"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.35.0"
    }
  }
}


provider "azurerm" {
  
  features {}

}

/*provider "vault" {
  version = "2.16.0"

  address = "http://127.0.0.1:8200/"
  token   = "s.LU0BanE17xc67dwk5pIusFxw"
}
*/
