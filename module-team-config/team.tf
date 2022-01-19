resource "github_team" "this" {
  name                      = var.team_name
  description               = var.team_description
  privacy                   = var.team_privacy
  create_default_maintainer = false
}

data "github_organization_team_sync_groups" "org_groups" {}

resource "github_team_sync_group_mapping" "this" {
  team_slug = github_team.this.slug

  dynamic "group" {
    for_each = [
      for g in data.github_organization_team_sync_groups.org_groups.groups :
      g if g.group_name == azuread_group.team_ad_group.display_name
    ]
    content {
      group_id          = group.value.group_id
      group_name        = group.value.group_name
      group_description = group.value.group_description
    }
  }
}