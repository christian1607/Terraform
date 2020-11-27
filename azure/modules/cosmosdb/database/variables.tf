variable "cosmosdb_db_name" {
  type        = string
  default     = null
  description = "CosmosDB Database name"
}

variable "cosmosdb_db_rg" {
  type        = string
  default     = null
  description = "CosmosDB Resource group"
}

variable "cosmosdb_db_account_name" {
  type        = string
  default     = null
  description = "CosmosDB Account Name"
}

variable "cosmosdb_db_throughput" {
  type        = number
  default     = 400
  description = "Database Trhoughput"

}

