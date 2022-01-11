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
    AWS_KEY_MAIN            = var.aws_key_main
    AWS_SECRET_MAIN         = var.aws_secret_main
    AWS_KEY_STAGING         = var.aws_key_staging
    AWS_SECRET_STAGING      = var.aws_secret_staging
    AWS_KEY_DEVELOP         = var.aws_key_develop
    AWS_SECRET_DEVELOP      = var.aws_secret_develop
    AWS_KEY_DEPLOYMENT      = var.aws_key_deployment
    AWS_SECRET_DEPLOYMENT   = var.aws_secret_deployment
    AWS_DEVELOP_DEPLOY_ROLE = var.develop_deploy_role
    AWS_STAGING_DEPLOY_ROLE = var.staging_deploy_role
    AWS_MAIN_DEPLOY_ROLE    = var.main_deploy_role
    SERVERLESS_TOKEN        = ""
    CF_DISTRIBUTION_MAIN    = ""
    CF_DISTRIBUTION_STAGING = ""
    CF_DISTRIBUTION_DEVELOP = ""
  }
}