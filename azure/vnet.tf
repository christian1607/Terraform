
module "key_vault_resource_group" {
  source = "./modules/resource_group"

  location            = var.location
  project             = var.project
  resource_group_name = "rg-caltamirano-keyvault-002"
  tags                = var.tags

}


module "azure_vnet" {
  source = "./modules/vnet"

  location            = var.location
  resource_group_name = module.key_vault_resource_group.rg_name
  vnet_name           = "vnet-caltamirano-personal-001"
  vnet_address_space  = ["10.0.0.0/16"]
}

module "azure_vnet_subnet_1" {
  source = "./modules/vnet/subnet"

  resource_group_name      = module.key_vault_resource_group.rg_name
  subnet_name              = "sn-caltamirano-personal-001"
  vnet_name                = module.azure_vnet.name
  subnet_address_prefixes  = ["10.0.0.0/24"]
  subnet_service_endpoints = ["Microsoft.KeyVault","Microsoft.AzureCosmosDB"]
}

module "azure_vnet_subnet_2" {
  source = "./modules/vnet/subnet"

  resource_group_name      = module.key_vault_resource_group.rg_name
  subnet_name              = "sn-caltamirano-personal-002"
  vnet_name                = module.azure_vnet.name
  subnet_address_prefixes  = ["10.0.1.0/24"]
  subnet_service_endpoints = ["Microsoft.KeyVault"]

}

