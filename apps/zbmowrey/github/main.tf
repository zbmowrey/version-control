module "repositories" {
  source = "..\/..\/..\/modules\/repository"
  repository_web_name = "zbmowrey-com-web"
  repository_api_name = "zbmowrey-com-api"
  aws_key             = var.aws_key
  aws_secret          = var.aws_secret
  github_token        = var.github_token
  github_org          = var.github_org
}
