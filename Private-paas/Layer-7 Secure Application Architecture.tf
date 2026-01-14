module "monster-rg" {
  source              = "../modules/resource_group"
  resource_group_name = "monster-rg"
  location            = "westeurope"
}
module "monster-vnet" {
  source              = "../modules/vnet"
  vnet_name           = "monster-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = module.monster-rg.location
  resource_group_name = module.monster-rg.name
}
module "subnet-monster-1" {
  source              = "../modules/subnet"
  subnet_name         = "s-appgateway"
  address_prefixes    = ["10.0.2.0/24"]
  location            = module.monster-rg.location
  vnet_name           = module.monster-vnet.vnet_name
  resource_group_name = module.monster-rg.name
}
module "subnet-monster-2" {
  source              = "../modules/subnet"
  subnet_name         = "s-webapp"
  address_prefixes    = ["10.0.1.0/24"]
  location            = module.monster-rg.location
  vnet_name           = module.monster-vnet.vnet_name
  resource_group_name = module.monster-rg.name
}

module "monster-appgateway" {
  source               = "../modules/app_gateway"
  app_gateway_name     = "monster-appgateway"
  resource_group_name  = module.monster-rg.name
  location             = module.monster-rg.location
  subnet_id            = module.subnet-monster-1.subnet_id
  public_ip_address_id = module.monster-public-ip.public_ip_id
  frontend_port        = 80
}
module "monster-public-ip" {
  source              = "../modules/Public-IP"
  public_ip_name      = "monster-public-ip"
  location            = module.monster-rg.location
  resource_group_name = module.monster-rg.name
}

