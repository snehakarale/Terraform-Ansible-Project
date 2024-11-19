variable "dns_name_label" {
  type    = string
  default = "loadbalancer9123" # Adjust default to something unique
}

variable "lb_name" {
  type = string
}

variable "location" {
  type = string
}
variable "rg_name" {
  type = string
}

variable "public_ip_name" {
  type    = string
  default = "lb9123_public_ip"
}

variable "lb_backend_address_pool_name" {
  type    = string
  default = "lb9123_address_pool"
}

variable "lb_rule" {
  type = object({
    name                           = string,
    protocol                       = string,
    frontend_port                  = number
    backend_port                   = number
    frontend_ip_configuration_name = string
  })

  default = {
    name                           = "LBRule",
    protocol                       = "Tcp",
    frontend_port                  = 80
    backend_port                   = 80
    frontend_ip_configuration_name = "PublicIPAddress"

  }
}

variable "lb_probe" {

  type = object({
    name = string,
    port = number
  })

  default = {
    name = "http-running-probe"
    port = 80
  }

}

variable "vm_names" {
  type = list(string)
}

variable "network_interface_ids" {
  type = list(string)
}

locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Sneha.Karale"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"

  }
}