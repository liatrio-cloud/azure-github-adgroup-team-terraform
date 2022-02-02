# Uncomment the below to pull in repos based on name.
# We're using a GitHub app to manage protections, so this conflicts

#data "github_repositories" "team_repos" {
#  query = "org:${var.org} ${var.team_name}-"
#}

locals {
  team_repo_list = concat(
#    data.github_repositories.team_repos.names,
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

# Uncomment the below to apply branch protections to the team's repositories
# We're using a GitHub app to manage protections, so this conflicts

#module "branch_protections" {
#  source = "../module-repo-config"
#  providers = {
#    github = github
#  }
#
#  repos = local.team_repo_list
#}
