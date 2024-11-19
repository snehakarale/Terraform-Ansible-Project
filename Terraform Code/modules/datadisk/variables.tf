#LOCATION
variable "location" {
  type = string
}

#RESOURCE GROUP
variable "rg_name" {
  type = string
}

variable "data_disks" {
  type = map(string)
  default = {
    storage_account_type = "Standard_LRS"
    create_option        = "Empty"
    disk_size_gb         = "10"
  }

}

variable "disk_count" {
  type = number
}

variable "caching" {
  type    = string
  default = "ReadWrite"
}

variable "name" {
  type        = string
  description = "Disk name"
}

variable "win_vm_ids" {

}

variable "linux_vm_ids" {

}

locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Sneha.Karale"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"

  }
}