# Define an Azure PostgreSQL Server instance
resource "azurerm_postgresql_server" "postgresql_server" {
  name                         = var.server_name
  location                     = var.location
  resource_group_name          = var.rg_name
  sku_name                     = var.postgresql_server["sku_name"]
  administrator_login          = var.postgresql_server["administrator_login"]
  administrator_login_password = var.postgresql_server["administrator_login_password"]
  version                      = var.postgresql_server["version"]
  ssl_enforcement_enabled      = true
  tags                = local.common_tags
}

# Define an Azure PostgreSQL Database
resource "azurerm_postgresql_database" "postgresql_database" {
  name                = var.db_name
  resource_group_name = var.rg_name
  server_name         = azurerm_postgresql_server.postgresql_server.name
  charset             = var.postgresql_database["charset"]
  collation           = var.postgresql_database["collation"]
 
}