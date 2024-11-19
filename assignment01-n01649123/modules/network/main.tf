
#-------- NETWORK SECURITY GROUP -------------------------

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsg
  location            = var.location
  resource_group_name = var.rg_name
  tags                = local.common_tags

}

#--------- VIRTUAL NETWORK --------------------------------

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = var.vnet_space
  tags                = local.common_tags
}

#---------- SUBNET --------------------------------------------

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_space

}

#----------- SECURITY RULES -----------------------------------

resource "azurerm_network_security_rule" "rules-subnet" {
  for_each                    = { for rule in var.rules-subnet : rule.name => rule }
  name                        = each.value.name
  direction                   = "Inbound"
  protocol                    = each.value.protocol
  priority                    = each.value.priority
  access                      = each.value.access
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.rg_name
  network_security_group_name = azurerm_network_security_group.nsg.name

}

#-------------- SUBNET NETWORK SECURITY GROUP ASSOCIATION --------------------------

resource "azurerm_subnet_network_security_group_association" "ga" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id

}


