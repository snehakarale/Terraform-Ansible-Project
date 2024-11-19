
# modules/linux/outputs.tf

output "windows_avs_name" {
  value = azurerm_availability_set.windows_avs.name
}

output "vm_names" {
  value = [for vm in azurerm_windows_virtual_machine.vmwindows : vm.name]
}

output "private_ip_addresses" {
  value = [for nic in azurerm_network_interface.windows_nic : nic.private_ip_address]
}

output "public_ip_addresses" {
  value = [azurerm_windows_virtual_machine.vmwindows[*].public_ip_address]
}

output "Windows_FQDN" {
  value = [azurerm_public_ip.windows_pip[*].fqdn]
}

output "windows_vm_ids" {
  value = azurerm_windows_virtual_machine.vmwindows[*].id
}