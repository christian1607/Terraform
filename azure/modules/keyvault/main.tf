resource "azurerm_key_vault" "keyvault" {
  name                        = var.kv_name
  location                    = var.kv_location
  resource_group_name         = var.kv_resource_group_name
  enabled_for_disk_encryption = var.kv_enable_disk_encryption
  tenant_id                   = var.kv_tenant_id
  soft_delete_enabled         = var.kv_soft_delete
  soft_delete_retention_days  = var.kv_retention_days
  purge_protection_enabled    = var.kv_purge_protection
  sku_name                    = var.kv_sku

  network_acls {
    bypass = var.kv_bypass
    default_action = var.kv_default_action
    ip_rules = var.kv_ip_rules
    virtual_network_subnet_ids = var.kv_virtual_network_subnet_ids
  }

  tags = var.tags
}

