#--------------- AVAILABILITY SET --------------------------------------

resource "azurerm_availability_set" "linux_avs" {
  name                         = var.linux_avs
  location                     = var.location
  resource_group_name          = var.rg_name
  platform_update_domain_count = "5"
  platform_fault_domain_count  = "2"
  tags                         = local.common_tags
}

#----------- LINUX VM --------------------------------------------------

resource "azurerm_linux_virtual_machine" "vmlinux" {
  for_each            = var.linux_name
  name                = "linux-${each.key}"
  location            = var.location
  resource_group_name = var.rg_name



  network_interface_ids = [azurerm_network_interface.linux_nic[each.key].id]
  size                  = each.value
  admin_username        = var.admin_username
  computer_name         = each.key
  availability_set_id   = azurerm_availability_set.linux_avs.id

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key)
  }

  os_disk {
    name                 = "${each.key}-os-disk"
    caching              = var.OS_disk_attr["caching"]
    storage_account_type = var.OS_disk_attr["storage_account_type"]
  }

  source_image_reference {
    publisher = var.OS_info["publisher"]
    offer     = var.OS_info["offer"]
    sku       = var.OS_info["sku"]
    version   = var.OS_info["version"]
  }

  boot_diagnostics {
    #   #storage_account_uri = "${var.storage_account_uri}boot_diagnostics_file/linux-vm-${each.key}"
       #storage_account_uri = "${var.storage_account_uri}/${var.storage_container_name}/boot_diagnostics_file/linux-vm-${each.key}"
    storage_account_uri = var.storage_account_uri


  }

  tags = local.common_tags
}

#------------- PUBLIC IP ADDRESS ----------------------------------------------

resource "azurerm_public_ip" "linux_pip" {
  for_each            = var.linux_name
  name                = "${each.key}-pip"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Dynamic"
  domain_name_label   = "${each.key}-pip"
  tags                = local.common_tags


}

#-------------- NETWORK INTERFACE -------------------------------------------------

resource "azurerm_network_interface" "linux_nic" {
  for_each            = var.linux_name
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linux_pip[each.key].id
  }
  tags = local.common_tags
}


# Azure Monitor Linux Agent
resource "azurerm_virtual_machine_extension" "AzureMonitorLinuxAgent" {
  for_each             = var.linux_name
  name                 = var.vm_extensions[0].name
  virtual_machine_id   = azurerm_linux_virtual_machine.vmlinux[each.key].id
  publisher            = var.vm_extensions[0].publisher
  type                 = var.vm_extensions[0].type
  type_handler_version = var.vm_extensions[0].type_handler_version
  tags                 = local.common_tags
}

# Network Watcher Agent Linux
resource "azurerm_virtual_machine_extension" "NetworkWatcherAgentLinux" {
  for_each             = var.linux_name
  name                 = var.vm_extensions[1].name
  virtual_machine_id   = azurerm_linux_virtual_machine.vmlinux[each.key].id
  publisher            = var.vm_extensions[1].publisher
  type                 = var.vm_extensions[1].type
  type_handler_version = var.vm_extensions[1].type_handler_version
  tags                 = local.common_tags
}