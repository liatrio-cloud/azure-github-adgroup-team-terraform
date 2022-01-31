# GitHub Enterprise Team Management via Terraform

##### IaC configuration for GitHub teams, IdP (AAD) integration, and branch protections
More generally, this repo is for managing teams and repos for a GitHub Organization configuration.

### Prerequisites
For the `azurerm` provider, you will need to first authenticate with Azure via `az login` or include the Azure Environment Variables:
```shell
ARM_CLIENT_ID
ARM_CLIENT_SECRET
ARM_SUBSCRIPTION_ID
ARM_TENANT_ID
```
You also need to provide the `GITHUB_TOKEN` (PAT) for the GitHub API with the `admin:enterprise, admin:org, repo` scopes assigned. 

### Usage
To set up a new team in your GitHub Organization, add a new entry in `/tf/teams.tf`: 
```terraform
module "team-example" {
  source = "../module-team-config"
  providers = {
    github  = github
    azuread = azuread
  }
  org        = var.org
  permission = var.default_access
  # Values above this line should be the same for each team
  team_name        = "example"
  team_description = "Example team"
  team_repos       = ["some-other-repo"]
}
```

This will:
* create a new team `example`
* create an Azure Active Directory group `github_sync_orgname_example`
* set up `github_sync_orgname_example` as the IdP sync group for `example`
* give the `example` team `maintainer` level access to all repos that that start with `example-`, as well as `some-other-repo`
* apply branch protections to `main` for all of the same repos


### Config Structure
* **Root config**
  * **Team module**
    * GitHub Team
    * AAD Group
    * Maintainer access for team to matching and specified repos
    * **Repo module**
      * Branch protection for matching and specified repos


### Repo structure
* `/tf`
  * Root config, uses team module
* `/module-team-config`
  * Module for setting up a team, uses repo module
* `/module-repo-config`
  * Module for configuring branch protections for a repo
*  `/tf/backend.tf`
  * Backend configuration: Update the backend config to match your `tfstate` storage needs.

### Terraform Usage
Nothing strange here yet - `terraform init`, `terraform plan`, and `terraform apply` your infrastructure.
