data "azurerm_resource_group" "dzik-rg" {
  name = "1-dea61712-playground-sandbox"
}

module "dzik-acr" {
  source                  = "../modules/container_registry"
  container_registry_name = "dzikacr"
  location                = data.azurerm_resource_group.dzik-rg.location
  resource_group_name     = data.azurerm_resource_group.dzik-rg.name


}
module "dzik-cae" {
  source              = "../modules/container_app_env"
  container_app_name  = "dzik-cae"
  location            = data.azurerm_resource_group.dzik-rg.location
  resource_group_name = data.azurerm_resource_group.dzik-rg.name
}

module "dzik-ca" {
  source                       = "../modules/container_app"
  container_app_name           = "dzik-ca"
  location                     = data.azurerm_resource_group.dzik-rg.location
  resource_group_name          = data.azurerm_resource_group.dzik-rg.name
  container_name               = "dzik-container"
  container_image              = "nginx:latest"
  cpu                          = "0.25"
  memory                       = "0.5Gi"
  container_app_environment_id = module.dzik-cae.container_app_environment_id
  environment                  = "development"
  target_port                  = 80
  external_enabled             = true
  latest_revision              = true
  scale = {
    min_replicas = 1
    max_replicas = 1
  }
}

module "dzik-ca-role-assignment" {
  source               = "../modules/role_assignment"
  scope                = module.dzik-acr.container_registry_id
  role_definition_name = "contributor"
  principal_id         = module.dzik-ca.principal_id
}

