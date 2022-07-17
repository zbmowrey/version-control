module "repo-zbmowrey-laravel-serverless" {
  providers = {
    github = github.zbmowrey
  }

  source                 = "./modules/repository"
  github_org             = "zbmowrey"
  repository_base_name   = "laravel-serverless"
  repository_description = "Laravel, Lambda, Dynamo, and other AWS Services."

  create_develop = true
  create_staging = true

  terraform_cloud_token = var.terraform_cloud_token
  serverless_token      = var.serverless_token_zbmowrey

  repository_visibility = "public"

  secrets = merge(local.app_repo_secrets,{
    SERVERLESS_TOKEN        = var.serverless_token_zbmowrey
  })
}