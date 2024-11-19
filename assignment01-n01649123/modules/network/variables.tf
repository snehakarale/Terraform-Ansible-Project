# modules/network/variables.tf

locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Sneha.Karale"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"

  }
}

variable "vnet" {
  description = "Name of the virtual network"
  type        = string
}

variable "vnet_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}

variable "subnet" {
  description = "Name of the first subnet"
  type        = string
}

variable "subnet_space" {
  description = "Address prefix for the first subnet"
  type        = list(string)
}

variable "nsg" {
  description = "Name of the first network security group"
  type        = string
}

variable "rg_name" {
  description = "Name of network resource group"
}

variable "location" {
  description = "Name of the location"
}

variable "rules-subnet" {
  type = list(object(
    {
      name                       = string
      priority                   = number
      access                     = string
      protocol                   = string
      source_address_prefix      = optional(string)
      destination_address_prefix = optional(string)
      source_port_range          = optional(string)
      destination_port_range     = optional(string)
      description                = optional(string)

    }
  ))
  default = [
    {
      name                       = "rule1"
      priority                   = 100
      access                     = "Allow"
      protocol                   = "Tcp"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      source_port_range          = "*"
      destination_port_range     = 22

    },
    {
      name                       = "rule2"
      priority                   = 200
      access                     = "Allow"
      protocol                   = "Tcp"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      source_port_range          = "*"
      destination_port_range     = 80

    },
    {
      name                       = "rule3"
      priority                   = 300
      access                     = "Allow"
      protocol                   = "Tcp"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      source_port_range          = "*"
      destination_port_range     = 3389

    },
    {
      name                       = "rule4"
      priority                   = 400
      access                     = "Allow"
      protocol                   = "Tcp"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      source_port_range          = "*"
      destination_port_range     = 5985
    }

  ]
  description = "These are 4 inbound rules defined for subnet"

}

