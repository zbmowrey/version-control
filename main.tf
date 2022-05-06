terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
  }
  backend "remote" {
    organization = "zbmowrey-cloud-admin"

    workspaces {
      name = "version-control"
    }
  }
}

provider "github" {
  alias = "zbmowrey"
  token = var.gh_token
  owner = "zbmowrey"
}

provider "github" {
  alias = "cloud-inc"
  token = var.gh_token
  owner = "clouddotinc"
}

provider "github" {
  alias = "repsales"
  token = var.gh_token
  owner = "repsales"
}

provider "github" {
  alias = "tomatowarning"
  token = var.gh_token
  owner = "tomatowarning"
}

locals {
  app_repo_secrets = {
    TERRAFORM_CLOUD_TOKEN   = var.terraform_cloud_token
    AWS_MAIN_ACCOUNT        = var.aws_main_account
    AWS_STAGING_ACCOUNT     = var.aws_staging_account
    AWS_DEVELOP_ACCOUNT     = var.aws_develop_account
    SERVERLESS_TOKEN        = ""
    CF_DISTRIBUTION_MAIN    = ""
    CF_DISTRIBUTION_STAGING = ""
    CF_DISTRIBUTION_DEVELOP = ""
  }
}