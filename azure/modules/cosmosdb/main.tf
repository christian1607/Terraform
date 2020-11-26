resource "azurerm_cosmosdb_account" "db" {
  name                = var.cosmosdb_name
  location            = var.cosmosdb_location
  resource_group_name = var.cosmosdb_rg
  offer_type          = var.cosmosdb_offer_type
  kind                = var.cosmosdb_kind
  enable_automatic_failover = var.cosmosdb_enable_automatic_failover


  consistency_policy {
    consistency_level       = var.cosmosdb_policy_consistency_level
    max_interval_in_seconds = var.cosmosdb_policy_max_interval_in_seconds
    max_staleness_prefix    = var.cosmosdb_policy_max_staleness_prefix
  }


  dynamic "geo_location" {

    for_each = var.cosmosdb_geo_locations
    content {
      location = geo_location.value["location"]
      failover_priority = geo_location.value["failover_priority"]
      zone_redundant = geo_location.value["zone_redundant"]
    }
  }

  tags = var.tags
}