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

  terraform_cloud_token = var.terraform_cloud_token
  serverless_token      = var.serverless_token_zbmowrey

  secrets = merge(local.app_repo_secrets, {
    SERVERLESS_TOKEN = var.serverless_token_zbmowrey
  })
}