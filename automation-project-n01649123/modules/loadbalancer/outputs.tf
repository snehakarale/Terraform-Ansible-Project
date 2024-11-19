output "lb_name" {
  value = azurerm_lb.lb.name
}

#------- FQDN --------------------
output "lb_dns" {
  value = azurerm_public_ip.public_ip.domain_name_label
}