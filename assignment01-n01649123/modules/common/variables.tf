locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Sneha.Karale"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"

  }
}

variable "rg_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location where resources will be deployed"
  type        = string
}

variable "log_analytics" {
  description = "The name of the Log Analytics Workspace"
  type        = map(string)
}

variable "recovery_vault" {
  description = "The name of the Recovery Services Vault"
  type        = map(string)
}

variable "storage_account" {
  description = "The name of the Storage Account"
  type        = map(string)
}

 variable "storage_container" {
   type = map(string)

   default = {
     "name"                  = "storage-container-9123",
     "container_access_type" = "private"
   }

 }