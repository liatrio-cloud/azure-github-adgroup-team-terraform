// # This will onboard & config the github-team-a team.
// module "team-a" {
//   source = "../module-team-config"
//   providers = {
//     github  = github
//     azuread = azuread
//   }
//   org        = var.org
//   permission = var.default_access
//   # Values above this line should be the same for each team
//   team_name        = "github-team-name-a"
//   team_description = "GitHub Team A"
//   # Example of a 
//   team_repos       = ["repo-to-manage","additional-repo-to-manage"]
// }

// # This will onboard & config the github-team-b team.
// module "team-b" {
//   source = "../module-team-config"
//   providers = {
//     github  = github
//     azuread = azuread
//   }
//   org        = var.org
//   permission = var.default_access
//   # Values above this line should be the same for each team
//   team_name        = "github-team-b"
//   team_description = "GitHub Team B"
// }
