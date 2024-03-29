module "repo-repsales-repsales-net" {
  providers = {
    github = github.cloud-inc
  }
  source                 = "./modules/repository"
  github_org             = "clouddotinc"
  repository_base_name   = "repsales-net"
  repository_description = "REP Sales, Inc. - primary site"

  create_develop = true
  create_staging = true

  terraform_cloud_token = var.terraform_cloud_token
  serverless_token      = var.serverless_token_repsales

  repository_visibility = "private"

  secrets = merge(local.app_repo_secrets, {
    AWS_DEVELOP_ACCOUNT     = var.cdi_dev_account
    AWS_MAIN_ACCOUNT        = var.cdi_main_account
    SERVERLESS_TOKEN        = var.serverless_token_repsales
    CF_DISTRIBUTION_MAIN    = var.cf_distribution_repsales_net_main
    CF_DISTRIBUTION_STAGING = var.cf_distribution_repsales_net_staging
    CF_DISTRIBUTION_DEVELOP = var.cf_distribution_repsales_net_develop
  })
}