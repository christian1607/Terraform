

variable "cosmosdb_name" {
  type        = string
  default     = null
  description = "CosmosDB name"
}

variable "cosmosdb_location" {
  type        = string
  default     = null
  description = "Primary Location"
}

variable "cosmosdb_rg" {
  type        = string
  default     = null
  description = "CosmosDB resource group"
}

variable "cosmosdb_offer_type" {
  type        = string
  default     = null
  description = "Offer Type (Standard)"

}

variable "cosmosdb_kind" {
  type        = string
  default     = "GlobalDocumentDB"
  description = "Specifies the Kind of CosmosDB to create - possible values are GlobalDocumentDB and MongoDB. Defaults to GlobalDocumentDB"
}

variable "cosmosdb_enable_automatic_failover" {
  type        = bool
  default     = true
  description = "Enable automatic fail over for this Cosmos DB account."
}

variable "cosmosdb_policy_consistency_level" {
  type        = string
  default     = null
  description = "The Consistency Level to use for this CosmosDB Account - can be either BoundedStaleness, Eventual, Session, Strong or ConsistentPrefix."
}

variable "cosmosdb_policy_max_interval_in_seconds" {
  type        = number
  default     = null
  description = "When used with the Bounded Staleness consistency level, this value represents the time amount of staleness (in seconds) tolerated. Accepted range for this value is 5 - 86400 (1 day). Defaults to 5. Required when consistency_level is set to BoundedStaleness"
}

variable "cosmosdb_policy_max_staleness_prefix" {
  type        = number
  default     = null
  description = "When used with the Bounded Staleness consistency level, this value represents the number of stale requests tolerated. Accepted range for this value is 10 – 2147483647. Defaults to 100. Required when consistency_level is set to BoundedStaleness"
}

variable "cosmosdb_geo_locations" {
  type        = list(object({
    location              = string
    failover_priority      = number
    zone_redundant = bool
  }))
  default     = []
  description = "CosmosDB geo locations configurations"
}

variable "tags" {
  type        = map(string)
  default     = null
}


variable "cosmosdb_enable_multiple_write_locations" {
  type        = bool
  default     = false
  description = "Enable multi-master support for this Cosmos DB account."
}


variable "cosmosdb_is_virtual_network_filter_enabled" {
  type        = bool
  default     = false
}

variable "cosmosdb_virtual_network_rule" {
  type        = list(object({
    id              = string
    ignore_missing_vnet_service_endpoint      = bool
  }))

  default     = []
  description = "CosmosDB geo locations configurations"
}

