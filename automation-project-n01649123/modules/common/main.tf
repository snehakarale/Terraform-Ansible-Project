# Create an Azure Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = var.log_analytics["name"]
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.log_analytics["log_sku"]
  retention_in_days   = var.log_analytics["rentention_days"]
  tags                = local.common_tags
}

# Create an Azure Recovery Services Vault
resource "azurerm_recovery_services_vault" "vault" {
  name                = var.recovery_vault["name"]
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.recovery_vault["vault_sku"]
  tags                = local.common_tags
}

# Create an Azure Storage Account
resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account["name"]
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = var.storage_account["tier"]
  account_replication_type = var.storage_account["replication_type"]
  tags                     = local.common_tags
}

resource "azurerm_storage_container" "storage_container" {
  name                  = var.storage_container["name"]
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = var.storage_container["container_access_type"]

}
