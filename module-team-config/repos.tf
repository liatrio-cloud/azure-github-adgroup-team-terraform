locals {
  team_repo_list = concat(
    var.team_repos
  )
}

# Add the repo to the team
resource "github_team_repository" "team_repo_link" {
  for_each   = toset(local.team_repo_list)
  team_id    = github_team.this.id
  repository = each.value
  permission = var.permission
}
