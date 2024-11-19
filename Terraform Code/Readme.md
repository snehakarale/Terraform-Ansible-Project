Overview-
This project automates the provisioning of resources in Azure using Terraform. It includes various child modules to create and configure infrastructure resources, such as:

Resource Group-
Networking (VNET, Subnet, NSG)
Common Services (Storage, Log Analytics, Recovery Vault)
Virtual Machines (Linux and Windows)
Data Disks
Load Balancer
Database (Azure DB for PostgreSQL)
The goal is to create a fully automated infrastructure deployment with a set of Terraform modules, utilizing Azure cloud services, including VM provisioning, networking, storage, and other common services.

Child Modules:
Each child module is responsible for provisioning a specific resource or set of resources.

rgroup: Creates a resource group (HumberID-RG).
network-HumberID: Creates a virtual network and subnet, and sets up a network security group with inbound rules for ports 22, 3389, 5985, and 80.
common-HumberID: Creates a Log Analytics workspace, Recovery Services Vault, and a standard LRS storage account.
vmlinux-HumberID: Creates 3 CentOS 8.2 Linux VMs with public IP addresses and unique DNS labels.
vmwindows-HumberID: Creates 1 Windows Server 2016 VM with a public IP address.
datadisk-HumberID: Creates and attaches 4 x 10GB disks to the VMs.
loadbalancer-HumberID: Creates a load balancer and places the Linux VMs behind it.
database-HumberID: Creates a PostgreSQL single server database instance.
