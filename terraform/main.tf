terraform {
    backend "azurerm" {
    resource_group_name = "terraform-deploy"  # Replace with your resource group name
    storage_account_name = "terraformsflg"  # Replace with your storage account name
    container_name = "aks-microservices-platform"  # Replace with your desired container name
    key = "terraform.tfstate"  # Optional: Specify the filename within the container (defaults to 'terraform.tfstate')
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.75.0"
    }
  }
}
provider "azurerm" {
  features {
  }
  subscription_id = var.subscription
  } 

module "azurerm_key_vault" {
  source = "./modules/security"
  keyvaultname                = var.keyvaultname
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  spobject_id                 = var.spobject_id
}
