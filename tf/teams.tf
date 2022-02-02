module "platform" {
  source = "../module-team-config"
  providers = {
    github  = github
    azuread = azuread
  }
  org        = var.org
  permission = var.default_access
  # Values above this line should be the same for each team
  team_name        = "platform"
  team_description = "The platform team"
  team_repos = [
    "azure-github-adgroup-team-terraform",
    "github-runner-infrastructure",
    "github-workflows",
    "runner-images"
  ]
}

