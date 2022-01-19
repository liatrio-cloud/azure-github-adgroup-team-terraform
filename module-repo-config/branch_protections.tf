data "github_repository" "repositories" {
  for_each = toset(var.repos)
  name     = each.value
}

resource "github_branch_protection" "main" {
  for_each = data.github_repository.repositories

  pattern       = "main"
  repository_id = each.value.node_id

  allows_deletions = false

  required_linear_history         = true
  require_conversation_resolution = true

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    required_approving_review_count = 1
  }

  required_status_checks {
    strict = true
  }

}
