module "repo-zbmowrey-insult-bot" {
  providers              = {
    github = github.zbmowrey
  }
  source                 = "./modules/repository"
  github_org             = "zbmowrey"
  repository_base_name   = "insult-bot"
  repository_description = "Slack Insult Bot - Gilfoyle Quotes"
  repository_visibility  = "public"

  create_develop = true
  create_staging = true

  terraform_cloud_token   = var.terraform_cloud_token
  serverless_token        = var.serverless_token_zbmowrey

  secrets = {
    SERVERLESS_TOKEN        = var.serverless_token_tomatowarning
    TERRAFORM_CLOUD_TOKEN   = var.terraform_cloud_token
    AWS_KEY_MAIN            = var.aws_key_main
    AWS_SECRET_MAIN         = var.aws_secret_main
    AWS_KEY_STAGING         = var.aws_key_staging
    AWS_SECRET_STAGING      = var.aws_secret_staging
    AWS_KEY_DEVELOP         = var.aws_key_develop
    AWS_SECRET_DEVELOP      = var.aws_secret_develop
  }
}