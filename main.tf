provider "azurerm" {
  features {}
}

provider "azuread" {

}

resource "azurerm_resource_group" "chenvwebapp" {
  name     = "chenvwebapp"
  location = "East US"
}


resource "azurerm_service_plan" "PlanWebapp1" {
  name                = "servicePlanWebapp1"
  location            = azurerm_resource_group.chenvwebapp.location
  resource_group_name = azurerm_resource_group.chenvwebapp.name
  os_type = "Linux"
  sku_name = "F1"
}

resource "azurerm_linux_web_app" "webapp-app1" {
  name                = "webapp-app1"
  location            = azurerm_resource_group.chenvwebapp.location
  resource_group_name = azurerm_resource_group.chenvwebapp.name
  service_plan_id     = azurerm_service_plan.PlanWebapp1.id
  site_config {
    always_on = false
  }
  app_settings = {
    "variableA" = "valor1"
 }
}

#segundo webapp2
resource "azurerm_resource_group" "chenvwebapp2" {
  name     = "chenvwebapp2"
  location = "East US"
}

resource "azurerm_service_plan" "PlanWebapp2" {
  name                = "servicePlanWebapp2"
  location            = azurerm_resource_group.chenvwebapp2.location
  resource_group_name = azurerm_resource_group.chenvwebapp2.name
  os_type = "Linux"
  sku_name = "F1"
}

resource "azurerm_linux_web_app" "webapp-app2" {
  name                = "webapp-app2"
  location            = azurerm_resource_group.chenvwebapp2.location
  resource_group_name = azurerm_resource_group.chenvwebapp2.name
  service_plan_id     = azurerm_service_plan.PlanWebapp2.id
  site_config {
    always_on = false
  }
  app_settings = {
    "variable" = "valor1"
 }
}