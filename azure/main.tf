
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
  subscription_id = "72a70c6f-90c3-4aca-a78d-6e538352c901"
  client_id       = "d2660c40-0d2c-48ee-b478-4af3831f1b93"
  client_secret   = "X~CLsM8mVvCWf4ktucJ5Zz2RXN_J5GZcQ2"
  tenant_id       = "a6c36135-a633-4acd-94b2-06b54f179f92"
  features {}

}

/*provider "vault" {
  version = "2.16.0"

  address = "http://127.0.0.1:8200/"
  token   = "s.LU0BanE17xc67dwk5pIusFxw"
}
*/
