# a. NAME
variable "linux_name" {
  type = map(string)
}

# #b. SIZE
# variable "size" {
#   type = string
# }

#c. ADMIN USERNAME
variable "admin_username" {
  type    = string
  default = "n01649123"
}

#d. PUBLIC KEY
variable "public_key" {
  type    = string
  default = "/home/n01649123/.ssh/id_rsa.pub"
}

variable "private_key" {
  type    = string
  default = "/home/n01649123/.ssh/id_rsa"
}


#e. DISK ATTRIBUTE
variable "OS_disk_attr" {
  type = map(string)
  default = {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

}

#f. OS INFORMATION
variable "OS_info" {
  type = map(string)

}

#g. AVAILABILITY SET

variable "linux_avs" {
  type = string
}

#h. LOCATION
variable "location" {
  type = string
}

#i. RESOURCE GROUP
variable "rg_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "storage_account_uri" {
  type = string
}

variable "storage_container_name" {
  type = string
 }

variable "vm_extensions" {
  type = list(object(
    {
      name                 = string,
      publisher            = string,
      type                 = string,
      type_handler_version = string
    }
  ))

  default = [
    {
      name                 = "NetworkWatcherAgentLinux",
      publisher            = "Microsoft.Azure.NetworkWatcher",
      type                 = "NetworkWatcherAgentLinux",
      type_handler_version = "1.4"
    },

    {
      name                 = "AzureMonitorLinuxAgent",
      publisher            = "Microsoft.Azure.Monitor",
      type                 = "AzureMonitorLinuxAgent",
      type_handler_version = "1.7"
    }
  ]
}

locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Sneha.Karale"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"

  }
}