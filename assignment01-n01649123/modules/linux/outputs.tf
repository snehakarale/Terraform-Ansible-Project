#a. VM HOSTNAME
output "Linux_hostname" {
  value = values(azurerm_linux_virtual_machine.vmlinux)[*].name
}

#------- b. VM FQDN --------------------
output "Linux_fqdn" {
  value = values(azurerm_public_ip.linux_pip)[*].fqdn
}

# ------- c. PRIVATE IP ------------
output "Linux_private_ip" {
  value = values(azurerm_linux_virtual_machine.vmlinux)[*].private_ip_address

}
#-----d. PUBLIC IP ------------
output "Linux_public_ip" {
  value = values(azurerm_linux_virtual_machine.vmlinux)[*].public_ip_address

}
output "Linux_avs_name" {
  value = azurerm_availability_set.linux_avs.name
}

output "Linux_vm_id" {
  value = values(azurerm_linux_virtual_machine.vmlinux)[*].id
}

output "Linux_nic_id" {
  value = values(azurerm_network_interface.linux_nic)[*].id
}