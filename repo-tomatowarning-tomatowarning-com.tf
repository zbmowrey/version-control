module "repo-tomatowarning-tomatowarning-com" {
  providers              = {
    github = github.tomatowarning
  }
  source                 = "./modules/repository"
  github_org             = "tomatowarning"
  repository_base_name   = "tomatowarning-com"
  repository_description = "https://tomatowarning.com"

  create_develop = true
  create_staging = true

  terraform_cloud_token   = var.terraform_cloud_token
  serverless_token        = var.serverless_token_tomatowarning

  repository_visibility = "public"

  secrets = {
    SERVERLESS_TOKEN        = var.serverless_token_tomatowarning
    TERRAFORM_CLOUD_TOKEN   = var.terraform_cloud_token
    AWS_KEY_MAIN            = var.aws_key_main
    AWS_SECRET_MAIN         = var.aws_secret_main
    AWS_KEY_STAGING         = var.aws_key_staging
    AWS_SECRET_STAGING      = var.aws_secret_staging
    AWS_KEY_DEVELOP         = var.aws_key_develop
    AWS_SECRET_DEVELOP      = var.aws_secret_develop
    CF_DISTRIBUTION_MAIN    = var.cf_distribution_tomatowarning_com_main
    CF_DISTRIBUTION_STAGING = var.cf_distribution_tomatowarning_com_staging
    CF_DISTRIBUTION_DEVELOP = var.cf_distribution_tomatowarning_com_develop
  }
}