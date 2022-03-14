# Create the web app, pass in the App Service Plan ID, and deploy code from a public GitHub repo
resource "azurerm_app_service" "webapp" {
  name                = "webapp-${random_integer.ri.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id
  site_config {
    linux_fx_version  = "NODE|16-lts"
  }
  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
  }  
  provisioner "local-exec" {
    command = "az webapp deployment list-publishing-profiles --resource-group ${azurerm_resource_group.rg.name} --name ${azurerm_app_service.webapp.name} --xml > publish.profile.xml"
  }
}
