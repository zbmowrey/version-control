module "repo-repsales-repsales-net" {
  providers               = {
    github = github.repsales
  }
  source                  = "./modules/repository"
  repository_base_name    = "repsales-net"
  repository_description  = "REP Sales, Inc. - primary site"
  repository_types        = ["none"]
  aws_key_main            = var.aws_key_main
  aws_secret_main         = var.aws_secret_main
  aws_key_staging         = var.aws_key_staging
  aws_secret_staging      = var.aws_secret_staging
  aws_key_develop         = var.aws_key_develop
  aws_secret_develop      = var.aws_secret_develop
  github_token            = var.github_token
  github_org              = "repsales"
  serverless_token        = var.serverless_token
  cf_distribution_develop = var.cf_distributions["repsales-net"]["develop"]
  cf_distribution_main    = var.cf_distributions["repsales-net"]["main"]
  cf_distribution_staging = var.cf_distributions["repsales-net"]["staging"]
  repository_visibility = "public"
}