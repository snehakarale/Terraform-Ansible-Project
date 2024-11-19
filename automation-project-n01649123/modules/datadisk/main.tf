# Define Azure Managed Disks for data disks
resource "azurerm_managed_disk" "data_disks" {
  count                = var.disk_count
  name                 = "datadisk-${var.name}-${count.index}"
  location             = var.location
  resource_group_name  = var.rg_name
  storage_account_type = var.data_disks["storage_account_type"]
  create_option        = var.data_disks["create_option"]
  disk_size_gb         = var.data_disks["disk_size_gb"]
  tags                 = local.common_tags
}

# Attach managed disks to Linux virtual machines
resource "azurerm_virtual_machine_data_disk_attachment" "linux_vm_disks" {
  count              = min(length(var.linux_vm_ids), 3)
  managed_disk_id    = azurerm_managed_disk.data_disks[count.index].id
  virtual_machine_id = var.linux_vm_ids[count.index]
  lun                = count.index
  caching            = var.caching

}

# Attach managed disks to a Windows virtual machine
resource "azurerm_virtual_machine_data_disk_attachment" "windows_vm_disk" {
  count              = min(length(var.win_vm_ids), 1)
  managed_disk_id    = azurerm_managed_disk.data_disks[3].id
  virtual_machine_id = var.win_vm_ids[count.index]
  lun                = count.index
  caching            = var.caching
}