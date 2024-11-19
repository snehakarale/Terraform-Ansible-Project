resource "azurerm_lb" "lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.rg_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
  tags = local.common_tags
}

resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Dynamic"
  tags                = local.common_tags
}

resource "azurerm_lb_backend_address_pool" "lb_backend_address_pool" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = var.lb_backend_address_pool_name

}

resource "azurerm_network_interface_backend_address_pool_association" "nic_backend_association" {
  count                   = length(var.vm_names)
  network_interface_id    = var.network_interface_ids[count.index]
  ip_configuration_name   = "ipconfig"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_backend_address_pool.id

}


resource "azurerm_lb_rule" "lb_rule" {
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = var.lb_rule.name
  protocol                       = var.lb_rule.protocol
  frontend_port                  = var.lb_rule.frontend_port
  backend_port                   = var.lb_rule.backend_port
  frontend_ip_configuration_name = var.lb_rule.frontend_ip_configuration_name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.lb_backend_address_pool.id]
  probe_id                       = azurerm_lb_probe.lb_probe.id

}

resource "azurerm_lb_probe" "lb_probe" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = var.lb_probe.name
  port            = var.lb_probe.port
}