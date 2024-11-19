
# modules/root/outputs.tf

# 1. Resource group name
output "rg_name" {
  value = module.rgroup-n01649123.rg.name
}

# 2. Virtual Network name
output "vnet_name" {
  value = module.network-n01649123.vnet.name
}

# 3. Network address space
output "vnet_address_space" {
  value = module.network-n01649123.vnet.address_space
}

# 4. Subnet Name
output "subnet_name" {
  value = module.network-n01649123.subnet.name
}

# 5. Subnet Address space
output "subnet_address_space" {
  value = module.network-n01649123.subnet.address_prefixes
}

#6. Security Group Name
output "security_group_name" {
  value = module.network-n01649123.nsg.name
}

#7. Log Analytics Workspace Name
output "log_analytics_workspace_name" {
  value = module.common-n01649123.log_analytics_workspace["name"]
}

#8. Vault Name
output "recovery_services_vault_name" {
  value = module.common-n01649123.recovery_services_vault["name"]
}

#9. Storage Account Name
output "storage_account_name" {
  value = module.common-n01649123.storage_account["name"]
}

#10. Linux VM Name
output "linux_vm_names" {
  value = module.linux-n01649123.Linux_hostname
}


#11. Linux Private IP address
output "linux_private_ip_addresses" {
  value = module.linux-n01649123.Linux_private_ip
}

#12. Linux Public IP address
output "linux_public_ip_addresses" {
  value = module.linux-n01649123.Linux_public_ip
}

output "linux_fqdn" {
  value = module.linux-n01649123.Linux_fqdn
}

output "windows_avs_name" {
  value = module.windows-n01649123.windows_avs_name
}

output "Windows_vm_names" {
  value = module.windows-n01649123.vm_names
}

output "Windows_private_ip_addresses" {
  value = module.windows-n01649123.private_ip_addresses
}

output "Windows_public_ip_addresses" {
  value = module.windows-n01649123.public_ip_addresses
}

output "Windows_FQDN" {
  value = module.windows-n01649123.Windows_FQDN
}

output "Windows_avs_name" {
  value = module.windows-n01649123.windows_avs_name
}

output "database_name" {
  value = module.database-n01649123.database_name
}

output "server_name" {
  value = module.database-n01649123.server_name
}

output "lb_name" {
  value = module.loadbalancer-n01649123.lb_name
}
