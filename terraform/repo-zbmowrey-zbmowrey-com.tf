module "repo-zbmowrey-zbmowrey-com" {


  source                 = "./modules/repository"
  github_org             = "zbmowrey"
  repository_base_name   = "zbmowrey-com"
  repository_description = "https://zbmowrey.com - a Resumé/Portfolio site."

  repository_types   = ["none"]
  aws_key_main       = var.aws_key_main
  aws_secret_main    = var.aws_secret_main
  aws_key_staging    = var.aws_key_staging
  aws_secret_staging = var.aws_secret_staging
  aws_key_develop    = var.aws_key_develop
  aws_secret_develop = var.aws_secret_develop
  github_token       = var.github_token
  serverless_token   = var.serverless_tokens.zbmowrey-com

  # Try to find cloudfront distribution IDs for each environment. If not found
  # for any reason, return "".

  cf_distribution_develop = lookup(lookup(var.cf_distributions, "zbmowrey-com", {
    zbmowrey-com = { develop = "" }
  }), "develop", "")
  cf_distribution_main    = lookup(lookup(var.cf_distributions, "zbmowrey-com", {
    zbmowrey-com = { develop = "" }
  }), "main", "")
  cf_distribution_staging = lookup(lookup(var.cf_distributions, "zbmowrey-com", {
    zbmowrey-com = { develop = "" }
  }), "staging", "")
  repository_visibility   = "public"
}


