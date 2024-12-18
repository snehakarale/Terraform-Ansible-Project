# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.54.0"
    }
  }
  required_version = "1.8.3"
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

