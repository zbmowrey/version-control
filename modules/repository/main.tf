# Creates 2 github repositories -
# web for html/js static site
# api for backend stuff
# both repos have develop, stage, and main branches

provider "github" {
  token = var.github_token
  owner = var.github_org
}

# Create Github Repositories

# Web Repository Secrets

locals {
  repository_type = var.create_api_repo == true ? toset(["web", "api"]) : toset(["base"])
}

resource "github_repository" "repo" {
  for_each               = local.repository_type
  name                   = each.value != "base" ? "${var.repository_base_name}-${each.value}" : var.repository_base_name
  description            = "${var.repository_base_name} ${each.value} - managed by Terraform"
  visibility             = var.repository_visibility != "" ? var.repository_visibility : "private"
  has_wiki               = false
  has_downloads          = false
  has_issues             = false
  has_projects           = false
  delete_branch_on_merge = true
  auto_init              = true
  vulnerability_alerts   = true
}

# Web Repository Branch Creation & Protection

resource "github_branch" "develop" {
  for_each   = github_repository.repo
  repository = each.value["name"]
  branch     = "develop"
}
resource "github_branch" "staging" {
  for_each   = github_repository.repo
  repository = each.value["name"]
  branch     = "staging"
}

# Create Github Repo Secrets
resource "github_actions_secret" "terraform_token" {
  for_each        = github_repository.repo
  repository      = each.value["name"]
  secret_name     = "TERRAFORM_CLOUD_TOKEN"
  plaintext_value = var.terraform_token
}

resource "github_actions_secret" "aws-key-main" {
  for_each        = github_repository.repo
  repository      = each.value["name"]
  secret_name     = "AWS_KEY_MAIN"
  plaintext_value = var.aws_key_main
}
resource "github_actions_secret" "aws-secret-main" {
  for_each        = github_repository.repo
  repository      = each.value["name"]
  secret_name     = "AWS_SECRET_MAIN"
  plaintext_value = var.aws_secret_main
}
resource "github_actions_secret" "aws-key-staging" {
  for_each        = github_repository.repo
  repository      = each.value["name"]
  secret_name     = "AWS_KEY_STAGING"
  plaintext_value = var.aws_key_staging
}
resource "github_actions_secret" "aws-secret-staging" {
  for_each        = github_repository.repo
  repository      = each.value["name"]
  secret_name     = "AWS_SECRET_STAGING"
  plaintext_value = var.aws_secret_staging
}
resource "github_actions_secret" "aws-key-develop" {
  for_each        = github_repository.repo
  repository      = each.value["name"]
  secret_name     = "AWS_KEY_DEVELOP"
  plaintext_value = var.aws_key_develop
}
resource "github_actions_secret" "aws-secret-develop" {
  for_each        = github_repository.repo
  repository      = each.value["name"]
  secret_name     = "AWS_SECRET_DEVELOP"
  plaintext_value = var.aws_secret_develop
}
