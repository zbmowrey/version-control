terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
  }
}

# Create Github Repositories

# Web Repository Secrets

locals {
  repository_visibility       = var.repository_visibility != "" ? var.repository_visibility : "private"
  dynamic_repository_settings = local.repository_visibility == "private" ? [] : [
    {
      dismiss_stale_reviews           = false
      dismissal_restrictions          = []
      require_code_owner_reviews      = false
      required_approving_review_count = 2
      restrict_dismissals             = false
    }
  ]
}

resource "github_repository" "repo" {
  name                   = var.repository_base_name
  description            = var.repository_description != "" ? var.repository_description : "${var.repository_base_name} - managed by Terraform"
  visibility             = var.repository_visibility != "" ? var.repository_visibility : "private"
  has_wiki               = var.has_wiki
  has_downloads          = var.has_downloads
  has_issues             = var.has_issues
  has_projects           = var.has_projects
  delete_branch_on_merge = false
  auto_init              = true
  vulnerability_alerts   = true
}


# Web Repository Branch Creation & Protection

resource "github_branch" "develop" {
  count = var.create_develop ? 1 : 0
  repository = github_repository.repo.id
  branch     = "develop"
}
resource "github_branch" "staging" {
  count = var.create_staging ? 1 : 0
  repository = github_repository.repo.id
  branch     = "staging"
}

resource "github_branch_protection" "main" {
  pattern       = "main"
  repository_id = github_repository.repo.id
  dynamic "required_pull_request_reviews" {
    for_each = local.dynamic_repository_settings
    content {
      dismiss_stale_reviews           = required_pull_request_reviews.value["dismiss_stale_reviews"]
      dismissal_restrictions          = required_pull_request_reviews.value["dismissal_restrictions"]
      require_code_owner_reviews      = required_pull_request_reviews.value["require_code_owner_reviews"]
      required_approving_review_count = required_pull_request_reviews.value["required_approving_review_count"]
      restrict_dismissals             = required_pull_request_reviews.value["restrict_dismissals"]
    }
  }
}

resource "github_branch_protection" "develop" {
  count = var.create_develop ? 1 : 0
  pattern       = "develop"
  repository_id = github_repository.repo.id
  dynamic "required_pull_request_reviews" {
    for_each = local.dynamic_repository_settings
    content {
      dismiss_stale_reviews           = required_pull_request_reviews.value["dismiss_stale_reviews"]
      dismissal_restrictions          = required_pull_request_reviews.value["dismissal_restrictions"]
      require_code_owner_reviews      = required_pull_request_reviews.value["require_code_owner_reviews"]
      required_approving_review_count = required_pull_request_reviews.value["required_approving_review_count"]
      restrict_dismissals             = required_pull_request_reviews.value["restrict_dismissals"]
    }
  }
}

resource "github_branch_protection" "staging" {
  count = var.create_staging ? 1 : 0
  pattern       = "staging"
  repository_id = github_repository.repo.id
  dynamic "required_pull_request_reviews" {
    for_each = local.dynamic_repository_settings
    content {
      dismiss_stale_reviews           = required_pull_request_reviews.value["dismiss_stale_reviews"]
      dismissal_restrictions          = required_pull_request_reviews.value["dismissal_restrictions"]
      require_code_owner_reviews      = required_pull_request_reviews.value["require_code_owner_reviews"]
      required_approving_review_count = required_pull_request_reviews.value["required_approving_review_count"]
      restrict_dismissals             = required_pull_request_reviews.value["restrict_dismissals"]
    }
  }
}

# Create secrets based on input at run-time.

resource "github_actions_secret" "secrets" {
  for_each        = var.secrets
  repository      = github_repository.repo.name
  secret_name     = each.key
  plaintext_value = each.value
}