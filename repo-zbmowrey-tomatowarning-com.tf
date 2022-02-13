module "repo-tomatowarning-tomatowarning-com" {
  providers              = {
    github = github.tomatowarning
  }
  source                 = "./modules/repository"
  github_org             = "zbmowrey"
  repository_base_name   = "tomatowarning-com"
  repository_description = "https://tomatowarning.com"

  create_develop = true
  create_staging = true

  terraform_cloud_token = var.terraform_cloud_token
  serverless_token      = var.serverless_token_tomatowarning

  repository_visibility = "public"

  secrets = merge(local.app_repo_secrets,{
    SERVERLESS_TOKEN        = var.serverless_token_tomatowarning
    CF_DISTRIBUTION_MAIN    = var.cf_distribution_tomatowarning_com_main
    CF_DISTRIBUTION_STAGING = var.cf_distribution_tomatowarning_com_staging
    CF_DISTRIBUTION_DEVELOP = var.cf_distribution_tomatowarning_com_develop
  })
}