#--------------- AVAILABILITY SET -------------------------------------

resource "azurerm_availability_set" "windows_avs" {
  name                         = var.windows_avs
  location                     = var.location
  resource_group_name          = var.rg_name
  platform_update_domain_count = "5"
  platform_fault_domain_count  = "2"
  tags                         = local.common_tags
}

#----------- WINDOWS VM --------------------------------------------------

resource "azurerm_windows_virtual_machine" "vmwindows" {

  count                 = var.vm_count
  name                  = "${var.windows_name}${format("%1d", count.index + 1)}"
  location              = var.location
  resource_group_name   = var.rg_name
  size                  = var.size
  network_interface_ids = [element(azurerm_network_interface.windows_nic[*].id, count.index)]

  availability_set_id = azurerm_availability_set.windows_avs.id


  computer_name  = "${var.windows_name}${format("%1d", count.index + 1)}"
  admin_username = var.admin_username_win
  admin_password = var.admin_password_win


  os_disk {
    name                 = "${var.windows_name}-os-disk${format("%1d", count.index + 1)}"
    caching              = var.win_OS_disk_attr["caching"]
    storage_account_type = var.win_OS_disk_attr["storage_account_type"]
    disk_size_gb         = var.win_OS_disk_attr["disk_size"]
  }

  source_image_reference {
    publisher = var.win_OS_info["publisher"]
    offer     = var.win_OS_info["offer"]
    sku       = var.win_OS_info["sku"]
    version   = var.win_OS_info["version"]
  }

  winrm_listener {
    protocol = "Http"
  }

  boot_diagnostics {
    #   storage_account_uri = "${var.storage_account_uri}boot_diagnostics_file/win-vm-${count.index}"
    storage_account_uri = var.storage_account_uri
  }

  tags = local.common_tags

}

#------------- PUBLIC IP ADDRESS ----------------------------------------------

resource "azurerm_public_ip" "windows_pip" {
  count               = var.vm_count
  name                = "${var.windows_name}-pip${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Dynamic"
  domain_name_label   = "${var.windows_name}${format("%1d", count.index + 1)}"
  tags                = local.common_tags
}

#-------------- NETWORK INTERFACE -------------------------------------------------

resource "azurerm_network_interface" "windows_nic" {
  count               = var.vm_count
  name                = "${var.windows_name}-nic${format("%1d", count.index + 1)}"
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = "${var.windows_name}-ipconfig${format("%1d", count.index + 1)}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.windows_pip[*].id, count.index)

  }
  tags = local.common_tags
}

# #----- EXTENSTIONS -------- 

resource "azurerm_virtual_machine_extension" "vm_extension" {
  count                = var.vm_count
  name                 = var.vm_extension.name
  virtual_machine_id   = element(azurerm_windows_virtual_machine.vmwindows[*].id, count.index)
  publisher            = var.vm_extension.publisher
  type                 = var.vm_extension.type
  type_handler_version = var.vm_extension.type_handler_version
  tags                 = local.common_tags
}