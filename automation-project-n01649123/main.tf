# modules/root/main.tf

# 1. Child Module for ResourceGroup:
module "rgroup-n01649123" {
  source   = "./modules/resource_group"
  rg_name  = "9123-RG"
  location = "canadacentral"
}

# 2. Child Module for Networking:
module "network-n01649123" {
  source       = "./modules/network"
  rg_name      = module.rgroup-n01649123.rg.name
  location     = module.rgroup-n01649123.rg.location
  vnet         = "9123-VNET"
  vnet_space   = ["10.0.0.0/16"]
  subnet       = "9123-SUBNET"
  subnet_space = ["10.0.1.0/24"]
  nsg          = "9123-NSG"
  depends_on   = [module.rgroup-n01649123]
}

# 3. Child Module for Common Services:
module "common-n01649123" {
  source   = "./modules/common"
  rg_name  = module.rgroup-n01649123.rg.name
  location = module.rgroup-n01649123.rg.location
  log_analytics = {
    name            = "log-analytics-9123"
    log_sku         = "PerGB2018"
    rentention_days = "30"
  }
  recovery_vault = {
    name      = "vault-9123"
    vault_sku = "Standard"
  }
  storage_account = {
    name             = "storagen01649123"
    tier             = "Standard"
    replication_type = "LRS"
  }
  depends_on = [module.rgroup-n01649123]
}

# 4. Child Module for Linux VM:
module "linux-n01649123" {

  source    = "./modules/linux"
  location  = module.rgroup-n01649123.rg.location
  rg_name   = module.rgroup-n01649123.rg.name
  linux_avs = "linux-avs"
  subnet_id = module.network-n01649123.subnet.id
  linux_name = {
    n01649123-vm1 = "Standard_B1ms"
    n01649123-vm2 = "Standard_B1ms"
    n01649123-vm3 = "Standard_B1ms"

  }

  OS_info = {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_4"
    version   = "latest"
  }
  storage_account_uri = module.common-n01649123.storage_account.primary_blob_endpoint

  #storage_container_name = module.common-n01649123.storage_container_name

  depends_on = [module.rgroup-n01649123, module.common-n01649123, module.network-n01649123]

}

#5. Child Module for Windows VM:
module "windows-n01649123" {
  source       = "./modules/windows"
  location     = module.rgroup-n01649123.rg.location
  windows_avs  = "windows-avs"
  rg_name      = module.rgroup-n01649123.rg.name
  subnet_id    = module.network-n01649123.subnet.id
  vm_count     = 1
  windows_name = "win-9123-vm"
  size         = "Standard_B1s"
  win_OS_info = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  storage_account_uri = module.common-n01649123.storage_account.primary_blob_endpoint
  depends_on          = [module.rgroup-n01649123, module.common-n01649123, module.network-n01649123]


}

#6. Child Module for Data Disks:
module "datadisks-n01649123" {
  source       = "./modules/datadisk"
  rg_name      = module.rgroup-n01649123.rg.name
  location     = module.rgroup-n01649123.rg.location
  name         = "9123-datadisk"
  disk_count   = 4
  win_vm_ids   = module.windows-n01649123.windows_vm_ids
  linux_vm_ids = module.linux-n01649123.Linux_vm_id
  depends_on   = [module.rgroup-n01649123, module.windows-n01649123, module.linux-n01649123]
}

#7. Child Module for Database:
module "database-n01649123" {
  source      = "./modules/database"
  rg_name     = module.rgroup-n01649123.rg.name
  location    = module.rgroup-n01649123.rg.location
  server_name = "9123-server"
  db_name     = "db-9123"
  depends_on  = [module.rgroup-n01649123]
}

#8. Child Module for Load Balancer:
module "loadbalancer-n01649123" {
  source                = "./modules/loadbalancer"
  lb_name               = "lb-9123"
  location              = module.rgroup-n01649123.rg.location
  rg_name               = module.rgroup-n01649123.rg.name
  vm_names              = module.linux-n01649123.Linux_hostname
  network_interface_ids = module.linux-n01649123.Linux_nic_id
  depends_on            = [module.rgroup-n01649123, module.linux-n01649123]
}

# ansible provisioner
resource "null_resource" "ansible_provisioner" {
    depends_on = [module.linux-n01649123,module.datadisks-n01649123]

     provisioner "local-exec" {
      command = "ansible-playbook -i /home/n01649123/automation/ansible/automation-project-ansible-n01649123/hosts /home/n01649123/automation/ansible/automation-project-ansible-n01649123/n01649123-playbook.yml"
      environment = {
        ANSIBLE_HOST_KEY_CHECKING = "False"
       }
     }
   }