provider "azurerm" {
  features {}
}

provider "azuread" {

}

resource "azurerm_resource_group" "chenvwebapp" {
  name     = "chenvwebapp"
  location = "East US"
}


resource "azurerm_service_plan" "PlanmamiluPet" {
  name                = "servicePlanMamiluPet"
  location            = azurerm_resource_group.chenvwebapp.location
  resource_group_name = azurerm_resource_group.chenvwebapp.name
  os_type = "Linux"
  sku_name = "F1"
}

resource "azurerm_linux_web_app" "webapp-mamilupet" {
  name                = "webapp-mamilupet"
  location            = azurerm_resource_group.chenvwebapp.location
  resource_group_name = azurerm_resource_group.chenvwebapp.name
  service_plan_id     = azurerm_service_plan.PlanmamiluPet.id
  site_config {
    always_on = false
  }
  app_settings = {
    "variable" = "valor1"
 }
}

#segundo webapp2
resource "azurerm_resource_group" "chenvwebapp2" {
  name     = "chenvwebapp2"
  location = "East US"
}

resource "azurerm_service_plan" "PlanmamiluPet2" {
  name                = "servicePlanMamiluPet2"
  location            = azurerm_resource_group.chenvwebapp2.location
  resource_group_name = azurerm_resource_group.chenvwebapp2.name
  os_type = "Linux"
  sku_name = "F1"
}

resource "azurerm_linux_web_app" "webapp-mamilupet2" {
  name                = "webapp-mamilupet2"
  location            = azurerm_resource_group.chenvwebapp2.location
  resource_group_name = azurerm_resource_group.chenvwebapp2.name
  service_plan_id     = azurerm_service_plan.PlanmamiluPet2.id
  site_config {
    always_on = false
  }
  app_settings = {
    "variable" = "valor1"
 }
}