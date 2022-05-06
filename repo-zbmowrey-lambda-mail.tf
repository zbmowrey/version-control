module "repo-zbmowrey-lambda-mail" {
  providers = {
    github = github.zbmowrey
  }

  source                 = "./modules/repository"
  github_org             = "zbmowrey"
  repository_base_name   = "lambda-mail"
  repository_description = "A Serverless Framework email microservice."

  create_develop = true
  create_staging = true

  terraform_cloud_token = var.terraform_cloud_token
  serverless_token      = var.serverless_token_zbmowrey

  repository_visibility = "public"

  secrets = merge(local.app_repo_secrets, {
    SERVERLESS_TOKEN        = var.serverless_token_zbmowrey
  })
}