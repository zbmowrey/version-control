module "repositories" {
  source = "../../../modules/repository"
  repository_web_name = "repsales-net-web"
  repository_api_name = "repsales-net-api"
  aws_key             = var.aws_key
  aws_secret          = var.aws_secret
  github_token        = var.github_token
  github_org          = var.github_org
}
