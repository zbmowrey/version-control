module "repo-tomatowarning-tomatowarning-com" {
  providers               = {
    github = github.tomatowarning
  }
  source                  = "./modules/repository"
  github_org              = "tomatowarning"
  repository_base_name    = "tomatowarning-com"
  repository_description  = "https://tomatowarning.com"
  repository_types        = ["none"]
  aws_key_main            = var.aws_key_main
  aws_secret_main         = var.aws_secret_main
  aws_key_staging         = var.aws_key_staging
  aws_secret_staging      = var.aws_secret_staging
  aws_key_develop         = var.aws_key_develop
  aws_secret_develop      = var.aws_secret_develop
  github_token            = var.github_token
  serverless_token        = var.serverless_token
  cf_distribution_develop = var.cf_distributions["tomatowarning-com"]["develop"]
  cf_distribution_main    = var.cf_distributions["tomatowarning-com"]["main"]
  cf_distribution_staging = var.cf_distributions["tomatowarning-com"]["staging"]
  repository_visibility = "public"
}