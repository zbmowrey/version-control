module "repo-zbmowrey-zbmowrey-com" {
  providers = {
    github = github.zbmowrey
  }

  source                 = "./modules/repository"
  github_org             = "zbmowrey"
  repository_base_name   = "zbmowrey-com"
  repository_description = "https://zbmowrey.com - a Resumé/Portfolio site."

  create_develop = true
  create_staging = true

  terraform_cloud_token = var.terraform_cloud_token
  serverless_token      = var.serverless_token_zbmowrey

  repository_visibility = "public"

  secrets = merge(local.app_repo_secrets,{
    SERVERLESS_TOKEN        = var.serverless_token_zbmowrey
    CF_DISTRIBUTION_MAIN    = var.cf_distribution_zbmowrey_com_main
    CF_DISTRIBUTION_STAGING = var.cf_distribution_zbmowrey_com_staging
    CF_DISTRIBUTION_DEVELOP = var.cf_distribution_zbmowrey_com_develop
  })
}


