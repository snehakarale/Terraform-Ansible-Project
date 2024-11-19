locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Sneha.Karale"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"

  }
}


variable "server_name" {
  type = string
}

variable "location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "postgresql_server" {
  type = map(string)

  default = {
    sku_name                     = "B_Gen5_1",
    administrator_login          = "psqladmin9123"
    administrator_login_password = "psql-H@Sh1CoR3!-admin9123"
    version                      = "9.5"
  }
}

variable "postgresql_database" {
  type = map(string)

  default = {
    charset   = "UTF8",
    collation = "English_United States.1252"
  }
}

variable "db_name" {
  type = string
}