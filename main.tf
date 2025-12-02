provider "azurerm" {
  features {}
  subscription_id = "0d31639b-710c-4b88-985e-b83f596c7353"
}

module "rg-prod" {
  source              = "./modules/resource_group"
  resource_group_name = "rg-prod"
  location            = "westeurope"
}

module "rg-dev" {
  source              = "./modules/resource_group"
  resource_group_name = "rg-dev"
  location            = "eastus"
}
module "networking-prod" {
  source              = "./modules/vnet"
  vnet_name           = "vnet-prod"
  address_space       = ["10.0.0.0/16"]
  location            = module.rg-prod.location
  resource_group_name = module.rg-prod.name
}

module "subnet-prod" {
  source              = "./modules/subnet"
  subnet_name         = "subnet-prod"
  address_prefixes    = ["10.0.1.0/24"]
  location            = module.rg-prod.location
  resource_group_name = module.rg-prod.name
  vnet_name           = module.networking-prod.vnet_name
}
