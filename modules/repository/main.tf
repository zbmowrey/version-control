# Creates 2 github repositories -
# web for html/js static site
# api for backend stuff
# both repos have develop, stage, and main branches with protection enabled.

provider "github" {
  token = var.github_token
  organization = var.github_org
}

# Create Github Repositories

resource "github_repository" "web" {
  name = var.repository_web_name
  description = "Front-end Website"
  visibility = "private"
  has_wiki = false
  has_downloads = false
  has_issues = false
  has_projects = false
  delete_branch_on_merge = true
  auto_init = true
}

resource "github_repository" "api" {
  name = var.repository_api_name
  description = "API & Back-End Services"
  visibility = "private"
  has_wiki = false
  has_downloads = false
  has_issues = false
  has_projects = false
  delete_branch_on_merge = true
  auto_init = true
}

# Web Repository Branch Creation & Protection

resource "github_branch_protection" "web-main" {
  repository = github_repository.web.name
  branch = "main"
  enforce_admins = true
  allows_deletions = false
  allows_force_pushes = false
}
resource "github_branch" "web-develop" {
  repository = github_repository.web.name
  branch = "develop"
}
resource "github_branch_protection" "web-develop" {
  repository = github_repository.web.name
  branch = "develop"
  enforce_admins = true
  allows_deletions = false
  allows_force_pushes = false
}
resource "github_branch" "web-stage" {
  repository = github_repository.web.name
  branch = "stage"
}
resource "github_branch_protection" "web-stage" {
  repository = github_repository.web.name
  branch = "stage"
  enforce_admins = true
  allows_deletions = false
  allows_force_pushes = false
}


# API Repository Branch Creation & Protection

resource "github_branch_protection" "api-main" {
  repository = github_repository.api.name
  branch = "main"
  enforce_admins = true
  allows_deletions = false
  allows_force_pushes = false
}
resource "github_branch" "api-develop" {
  repository = github_repository.api.name
  branch = "develop"
}
resource "github_branch_protection" "api-develop" {
  repository = github_repository.api.name
  branch = "develop"
  enforce_admins = true
  allows_deletions = false
  allows_force_pushes = false
}
resource "github_branch" "api-stage" {
  repository = github_repository.api.name
  branch = "stage"
}
resource "github_branch_protection" "api-stage" {
  repository = github_repository.api.name
  branch = "stage"
  enforce_admins = true
  allows_deletions = false
  allows_force_pushes = false
}


# Web Repository Secrets

resource "github_actions_secret" "aws-key-web" {
  repository = github_repository.web.name
  secret_name = "AWS_KEY"
  plaintext_value = var.aws_key
}
resource "github_actions_secret" "aws-secret-web" {
  repository = github_repository.web.name
  secret_name = "AWS_SECRET"
  plaintext_value = var.aws_secret
}

# API Repository Secrets

resource "github_actions_secret" "aws-key-api" {
  repository = github_repository.api.name
  secret_name = "AWS_KEY"
  plaintext_value = var.aws_key
}
resource "github_actions_secret" "aws-secret-api" {
  repository = github_repository.api.name
  secret_name = "AWS_SECRET"
  plaintext_value = var.aws_secret
}