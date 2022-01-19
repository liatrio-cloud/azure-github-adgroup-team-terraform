# azuread create group
data "azuread_client_config" "current" {}

resource "azuread_group" "team_ad_group" {
  display_name     = "github_sync_${local.org_name_clean}_${local.team_name_clean}"
  owners           = [data.azuread_client_config.current.object_id]
  security_enabled = true
}