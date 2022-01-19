terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~>4.19.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.14.0"
    }
  }
}

provider "github" {
  owner = var.org
}

provider "azuread" {}
