terraform {
  required_providers {
    github = {
      version = "~> 4.18.0"
    }
  }
}

# Create Github Repositories

# Web Repository Secrets

locals {
  repository_type             = toset(var.repository_types)
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
  for_each               = local.repository_type
  name                   = each.value != "none" ? "${var.repository_base_name}-${each.value}" : var.repository_base_name
  description            = each.value != "none" ? "${var.repository_base_name} ${each.value} - managed by Terraform" : var.repository_description != "" ? var.repository_description : "${var.repository_base_name} - managed by Terraform"
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
  for_each   = var.create_develop ? github_repository.repo : {}
  repository = each.value["name"]
  branch     = "develop"
}
resource "github_branch" "staging" {
  for_each   = var.create_staging ? github_repository.repo : {}
  repository = each.value["name"]
  branch     = "staging"
}

resource "github_branch_protection" "main" {
  for_each      = local.repository_visibility == "public" ? tomap(github_repository.repo) : tomap({})
  pattern       = "main"
  repository_id = github_repository.repo["none"].id
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
  for_each      = local.repository_visibility == "public" && var.create_develop ? tomap(github_repository.repo) : tomap({})
  pattern       = "develop"
  repository_id = github_repository.repo["none"].id
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
  for_each      = local.repository_visibility == "public" && var.create_staging ? tomap(github_repository.repo) : tomap({})
  pattern       = "staging"
  repository_id = github_repository.repo["none"].id
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

# Create Github Repo Secrets
resource "github_actions_secret" "terraform_token" {
  for_each        = var.terraform_token != "" ? github_repository.repo : {}
  repository      = each.value["name"]
  secret_name     = "TERRAFORM_CLOUD_TOKEN"
  plaintext_value = var.terraform_token
}
resource "github_actions_secret" "serverless_token" {
  for_each        = var.serverless_token != "" ? github_repository.repo : {}
  repository      = each.value["name"]
  secret_name     = "SERVERLESS_TOKEN"
  plaintext_value = var.serverless_token
}
resource "github_actions_secret" "aws-key-main" {
  for_each        = var.aws_key_main != "" ? github_repository.repo : {}
  repository      = each.value["name"]
  secret_name     = "AWS_KEY_MAIN"
  plaintext_value = var.aws_key_main
}
resource "github_actions_secret" "aws-secret-main" {
  for_each        = var.aws_secret_main != "" ? github_repository.repo : {}
  repository      = each.value["name"]
  secret_name     = "AWS_SECRET_MAIN"
  plaintext_value = var.aws_secret_main
}
resource "github_actions_secret" "aws-key-staging" {
  for_each        = var.create_staging && var.aws_key_staging != "" ? github_repository.repo : {}
  repository      = each.value["name"]
  secret_name     = "AWS_KEY_STAGING"
  plaintext_value = var.aws_key_staging
}
resource "github_actions_secret" "aws-secret-staging" {
  for_each        = var.create_staging && var.aws_secret_staging != "" ? github_repository.repo : {}
  repository      = each.value["name"]
  secret_name     = "AWS_SECRET_STAGING"
  plaintext_value = var.aws_secret_staging
}
resource "github_actions_secret" "aws-key-develop" {
  for_each        = var.create_develop && var.aws_key_develop != "" ? github_repository.repo : {}
  repository      = each.value["name"]
  secret_name     = "AWS_KEY_DEVELOP"
  plaintext_value = var.aws_key_develop
}
resource "github_actions_secret" "aws-secret-develop" {
  for_each        = var.create_develop && var.aws_secret_develop != "" ? github_repository.repo : {}
  repository      = each.value["name"]
  secret_name     = "AWS_SECRET_DEVELOP"
  plaintext_value = var.aws_secret_develop
}
resource "github_actions_secret" "cf-distribution-main" {
  for_each        = var.cf_distribution_main != "" ? github_repository.repo : {}
  repository      = each.value["name"]
  secret_name     = "CF_DISTRIBUTION_MAIN"
  plaintext_value = var.cf_distribution_main
}
resource "github_actions_secret" "cf-distribution-staging" {
  for_each        = var.create_staging && var.cf_distribution_staging != "" ? github_repository.repo : {}
  repository      = each.value["name"]
  secret_name     = "CF_DISTRIBUTION_STAGING"
  plaintext_value = var.cf_distribution_staging
}
resource "github_actions_secret" "cf-distribution-develop" {
  for_each        = var.create_develop && var.cf_distribution_develop != "" ? github_repository.repo : {}
  repository      = each.value["name"]
  secret_name     = "CF_DISTRIBUTION_DEVELOP"
  plaintext_value = var.cf_distribution_develop
}