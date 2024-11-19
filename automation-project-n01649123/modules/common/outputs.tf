output "log_analytics_workspace" {
  value = azurerm_log_analytics_workspace.log_analytics
}

output "recovery_services_vault" {
  value = azurerm_recovery_services_vault.vault
}

output "storage_account" {
  value = azurerm_storage_account.storage_account
}

output "storage_container_name" {

  value = azurerm_storage_container.storage_container.name

}