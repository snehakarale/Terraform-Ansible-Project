# a. NAME
variable "windows_name" {
  type = string
}

#b. ADMIN USERNAME
variable "admin_username_win" {
  default = "n01649123"
}

#c. ADMIN PASSWORD
variable "admin_password_win" {
  default = "sneha@123"
}

#d. DISK ATTRIBUTE
variable "win_OS_disk_attr" {
  type = map(string)
  default = {
    storage_account_type = "StandardSSD_LRS"
    disk_size            = "128"
    caching              = "ReadWrite"
  }
}

#e. OS INFORMATION
variable "win_OS_info" {
  type = map(string)

}

#f. AVAILABILITY SET

variable "windows_avs" {
  type = string
}

variable "location" {
  type = string
}

variable "rg_name" {
  type = string
}
variable "subnet_id" {
  type = string
}

variable "vm_count" {
  type = number
}

variable "size" {
  type = string
}

variable "storage_account_uri" {
  type = string
}

variable "vm_extension" {
  type = map(string)
  default = {
    name                 = "IaaSAntimalware",
    publisher            = "Microsoft.Azure.Security",
    type                 = "IaaSAntimalware",
    type_handler_version = "1.3"
  }
}

locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Sneha.Karale"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"

  }
}

