# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }
    required_version = ">= 0.14.9"
    backend "azurerm" {
        resource_group_name  = "tfstate"
        storage_account_name = "tfstate30512"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
    }
}
provider "azurerm" {
  features {}
}