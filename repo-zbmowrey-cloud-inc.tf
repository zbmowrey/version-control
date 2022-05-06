module "repo-zbmowrey-cloud-inc" {
  providers = {
    github = github.zbmowrey
  }

  source                 = "./modules/repository"
  github_org             = "zbmowrey"
  repository_base_name   = "cloud-inc"
  repository_description = "https://cloud.inc - a Cloud Company Side-Gig Website."

  create_develop = true
  create_staging = true

  terraform_cloud_token = var.terraform_cloud_token
  serverless_token      = var.serverless_token_zbmowrey

  repository_visibility = "public"

  secrets = merge(local.app_repo_secrets, {
    SERVERLESS_TOKEN        = var.serverless_token_zbmowrey
    CF_DISTRIBUTION_MAIN    = var.cf_distribution_cloud_inc_main
    CF_DISTRIBUTION_STAGING = var.cf_distribution_cloud_inc_staging
    CF_DISTRIBUTION_DEVELOP = var.cf_distribution_cloud_inc_develop
  })
}