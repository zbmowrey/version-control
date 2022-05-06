module "repo-cloud-dot-inc-cloud-inc" {
  providers = {
    github = github.cloud-inc
  }

  source                 = "./modules/repository"
  github_org             = "clouddotinc"
  repository_base_name   = "cloud-inc"
  repository_description = "https://cloud.inc - a Cloud Company Website."

  create_develop  = true
  create_staging  = false

  terraform_cloud_token = var.terraform_cloud_token
  serverless_token      = var.serverless_token_cloud_inc

  repository_visibility = "public"

  secrets = merge(local.app_repo_secrets, {
    AWS_DEVELOP_ACCOUNT     = var.cdi_dev_account
    AWS_MAIN_ACCOUNT        = var.cdi_main_account
    SERVERLESS_TOKEN        = var.serverless_token_cloud_inc
    CF_DISTRIBUTION_MAIN    = var.cf_distribution_cloud_inc_main
    CF_DISTRIBUTION_DEVELOP = var.cf_distribution_cloud_inc_develop
  })
}