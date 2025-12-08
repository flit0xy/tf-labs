resource "azurerm_container_app_environment" "container_app_env" {
  name                = "${var.container_app_name}-env"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_container_app" "container_app" {
  name                = var.container_app_name
  resource_group_name = var.resource_group_name
  container_app_environment_id = var.container_app_environment_id

  revision_mode = "Single"

  template {
    container {
      name   = var.container_name
      image  = var.container_image
      cpu    = var.cpu
      memory = var.memory

      env {
        name  = "ENVIRONMENT"
        value = var.environment
      }
    }
  }
  
}