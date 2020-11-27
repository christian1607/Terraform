resource "azurerm_cosmosdb_sql_database" "example" {
  name                = var.cosmosdb_db_name
  resource_group_name = var.cosmosdb_db_rg
  account_name        = var.cosmosdb_db_account_name
  throughput          = var.cosmosdb_db_throughput
}