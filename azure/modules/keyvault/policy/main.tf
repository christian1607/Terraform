resource "azurerm_key_vault_access_policy" "policy" {

  key_vault_id            = var.kv_vault_id
  tenant_id               = var.kv_tenant_id
  object_id               = var.kv_object_id
  key_permissions         = var.kv_key_permissions
  secret_permissions      = var.kv_secret_permissions
  certificate_permissions = var.kv_certificate_permissions
  storage_permissions     = var.kv_storage_permissions
}