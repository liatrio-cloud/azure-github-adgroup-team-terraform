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

locals {
  org_name_clean  = lower(var.org)
  team_name_clean = lower(var.team_name)
}