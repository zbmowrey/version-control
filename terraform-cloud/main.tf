provider "github" {
  token = var.github_token
  owner = var.github_org
}
resource "github_repository" "tfc" {
  name                   = "tfc"
  description            = "Terraform Cloud Workspace Management"
  visibility             = "public"
  has_wiki               = false
  has_downloads          = false
  has_issues             = false
  has_projects           = false
  delete_branch_on_merge = true
  auto_init              = true
  vulnerability_alerts   = false
}

# Create Github Repo Secrets
resource "github_actions_secret" "terraform-token" {
  repository      = github_repository.tfc.name
  secret_name     = "TERRAFORM_CLOUD_TOKEN"
  plaintext_value = var.terraform_token
}
resource "github_actions_secret" "aws-key-main" {
  repository      = github_repository.tfc.name
  secret_name     = "AWS_KEY_MAIN"
  plaintext_value = var.aws_key_main
}
resource "github_actions_secret" "aws-secret-main" {
  repository      = github_repository.tfc.name
  secret_name     = "AWS_SECRET_MAIN"
  plaintext_value = var.aws_secret_main
}
resource "github_actions_secret" "aws-key-staging" {
  repository      = github_repository.tfc.name
  secret_name     = "AWS_KEY_STAGING"
  plaintext_value = var.aws_key_staging
}
resource "github_actions_secret" "aws-secret-staging" {
  repository      = github_repository.tfc.name
  secret_name     = "AWS_SECRET_STAGING"
  plaintext_value = var.aws_secret_staging
}
resource "github_actions_secret" "aws-key-develop" {
  repository      = github_repository.tfc.name
  secret_name     = "AWS_KEY_DEVELOP"
  plaintext_value = var.aws_key_develop
}
resource "github_actions_secret" "aws-secret-develop" {
  repository      = github_repository.tfc.name
  secret_name     = "AWS_SECRET_DEVELOP"
  plaintext_value = var.aws_secret_develop
}
resource "github_actions_secret" "cf-distribution-main" {
  repository      = github_repository.tfc.name
  secret_name     = "CF_DISTRIBUTION_MAIN"
  plaintext_value = var.cf_distribution_main
}
resource "github_actions_secret" "cf-distribution-staging" {
  repository      = github_repository.tfc.name
  secret_name     = "CF_DISTRIBUTION_STAGING"
  plaintext_value = var.cf_distribution_staging
}
resource "github_actions_secret" "cf-distribution-develop" {
  repository      = github_repository.tfc.name
  secret_name     = "CF_DISTRIBUTION_DEVELOP"
  plaintext_value = var.cf_distribution_develop
}