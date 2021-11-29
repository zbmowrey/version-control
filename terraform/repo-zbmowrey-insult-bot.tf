module "repo-zbmowrey-insult-bot" {
  providers              = {
    github = github.zbmowrey
  }
  source                 = "./modules/repository"
  github_org             = "zbmowrey"
  repository_base_name   = "insult-bot"
  repository_description = "Slack Insult Bot - Gilfoyle Quotes"
  repository_types       = ["none"]
  aws_key_main           = var.aws_key_main
  aws_secret_main        = var.aws_secret_main
  aws_key_staging        = var.aws_key_staging
  aws_secret_staging     = var.aws_secret_staging
  aws_key_develop        = var.aws_key_develop
  aws_secret_develop     = var.aws_secret_develop
  github_token           = var.github_token
  repository_visibility = "public"
}