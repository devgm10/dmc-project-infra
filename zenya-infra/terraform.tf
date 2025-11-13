terraform {
  required_version = ">= 1.0"

  cloud {
    organization = "zenya-org"

    workspaces {
      name = "zenya-infra"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}