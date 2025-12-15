terraform {
    cloud {
      organization = "eud0r-1450"
      workspaces {
        name = "cambio-variable-wsTerraform"
      }
    }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.54.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.7.0"
  }
}
}