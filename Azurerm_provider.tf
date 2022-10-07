terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
  # subscription_id : "Ecole By Cap"
  subscription_id = "4510fe4b-0dc4-4726-86bd-0e1e18b81310"
}

data "azurerm_resource_group" "GroupeN" {
  name = "Groupe1" # change by Groupe1/Groupe2/...

}