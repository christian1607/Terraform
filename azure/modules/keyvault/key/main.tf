resource "azurerm_key_vault_key" "key" {
  name         = var.kv_key_name
  key_vault_id = var.kv_vault_id
  key_type     = var.kv_key_type
  key_size     = var.kv_key_size
  key_opts     = var.kv_key_opts
}