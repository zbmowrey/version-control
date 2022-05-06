module "repo-cloud-dot-inc-aws-org" {
  providers = {
    github = github.cloud-inc
  }

  source                 = "./modules/repository"
  github_org             = "clouddotinc"
  repository_base_name   = "aws-org"
  repository_description = "Cloud Governance IAC for Cloud.Inc"

  create_develop = false
  create_staging = false

  terraform_cloud_token = var.terraform_cloud_token
  serverless_token      = var.serverless_token_cloud_inc

  repository_visibility = "public"

  secrets = merge(local.app_repo_secrets, {
    SERVERLESS_TOKEN        = var.serverless_token_cloud_inc
    CF_DISTRIBUTION_MAIN    = var.cf_distribution_cloud_inc_main
    CF_DISTRIBUTION_STAGING = var.cf_distribution_cloud_inc_staging
    CF_DISTRIBUTION_DEVELOP = var.cf_distribution_cloud_inc_develop
  })
}