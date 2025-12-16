provider "azurerm" {
  features {}
}

provider "azuread" {

}

resource "azurerm_resource_group" "chenvwebapp1" {
  name     = "chenvwebapp1"
  location = "East US"
}


resource "azurerm_service_plan" "PlanWebapp1" {
  name                = "servicePlanWebapp1"
  location            = azurerm_resource_group.chenvwebapp1.location
  resource_group_name = azurerm_resource_group.chenvwebapp1.name
  os_type = "Linux"
  sku_name = "F1"
}

resource "azurerm_linux_web_app" "webapp-app1" {
  name                = "webapp-app1"
  location            = azurerm_resource_group.chenvwebapp1.location
  resource_group_name = azurerm_resource_group.chenvwebapp1.name
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
    "variableA" = "valordiferente"
 }
}

#tercer webapp3
resource "azurerm_resource_group" "chenvwebapp3" {
  name     = "chenvwebapp3"
  location = "East US"
}
resource "azurerm_service_plan" "PlanWebapp3" {
  name                = "servicePlanWebapp3"
  location            = azurerm_resource_group.chenvwebapp3.location
  resource_group_name = azurerm_resource_group.chenvwebapp3.name
  os_type = "Linux"
  sku_name = "F1"
}
resource "azurerm_linux_web_app" "webapp-app3" {
  name                = "webapp-app3"
  location            = azurerm_resource_group.chenvwebapp3.location
  resource_group_name = azurerm_resource_group.chenvwebapp3.name
  service_plan_id     = azurerm_service_plan.PlanWebapp3.id
  site_config {
    always_on = false
  }
  app_settings = {
    "variableA" = "valor1"
 }
}

#cuarto webapp4
resource "azurerm_resource_group" "chenvwebapp4" {
  name     = "chenvwebapp4"
  location = "East US"
} 
resource "azurerm_service_plan" "PlanWebapp4" {
  name                = "servicePlanWebapp4"
  location            = azurerm_resource_group.chenvwebapp4.location
  resource_group_name = azurerm_resource_group.chenvwebapp4.name
  os_type = "Linux"
  sku_name = "F1"
}
resource "azurerm_linux_web_app" "webapp-app4" {
  name                = "webapp-app4"
  location            = azurerm_resource_group.chenvwebapp4.location
  resource_group_name = azurerm_resource_group.chenvwebapp4.name
  service_plan_id     = azurerm_service_plan.PlanWebapp4.id
  site_config {
    always_on = false
  }
  app_settings = {
    "variableA" = "valor1"
 }
}

#quinto webapp5

resource "azurerm_resource_group" "chenvwebapp5" {
  name     = "chenvwebapp5"
  location = "East US"
}
resource "azurerm_service_plan" "PlanWebapp5" {
  name                = "servicePlanWebapp5"
  location            = azurerm_resource_group.chenvwebapp5.location
  resource_group_name = azurerm_resource_group.chenvwebapp5.name
  os_type = "Linux"
  sku_name = "F1"
}

resource "azurerm_linux_web_app" "webapp-app5" {
  name                = "webapp-app5"
  location            = azurerm_resource_group.chenvwebapp5.location
  resource_group_name = azurerm_resource_group.chenvwebapp5.name
  service_plan_id     = azurerm_service_plan.PlanWebapp5.id
  site_config {
    always_on = false
  }
  app_settings = {
    "variableA" = "valordiferente"
 }
}