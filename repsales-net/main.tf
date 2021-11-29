module "repositories" {
  source                  = "../modules/repository"
  repository_base_name    = var.repository_base_name
  repository_description  = "REP Sales, Inc. - primary site"
  repository_types        = ["web"]
  aws_key_main            = var.aws_key_main
  aws_secret_main         = var.aws_secret_main
  aws_key_staging         = var.aws_key_staging
  aws_secret_staging      = var.aws_secret_staging
  aws_key_develop         = var.aws_key_develop
  aws_secret_develop      = var.aws_secret_develop
  github_token            = var.github_token
  github_org              = var.github_org
  terraform_token         = var.terraform_token
  serverless_token        = var.serverless_token
  cf_distribution_develop = var.cf_distribution_develop
  cf_distribution_main    = var.cf_distribution_main
  cf_distribution_staging = var.cf_distribution_staging
}
