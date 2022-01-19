output "team_repos" {
  value = local.team_repo_list
}

output "team_ad_group" {
  value = azuread_group.team_ad_group.display_name
}