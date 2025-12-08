output "service_plan_id" {
    description = "The ID of the App Service Plan"
    value       = azurerm_service_plan.app_service_plan.id
}