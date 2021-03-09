provider aws "aws-main" {
  access_key = var.aws_key
  secret_key = var.secret_key
  region     = var.aws_region
}

resource "aws_s3_bucket" "tf-state" {
  bucket = "repsales-tf-state"
  acl    = "private"
  tags = {
    Name        = "RSI Terraform State Bucket"
    Environment = "Production"
    Client      = "repsales-net"
    Owner       = "Zach Mowrey"

  }
}

backend "s3" {
  bucket     = "repsales-tf-state"
  key        = "github-repositories"
  region     = var.aws_region
  access_key = var.aws_key
  secret_key = var.aws_secret
}

module "repositories" {
  source = "..\/..\/..\/modules\/repository"
  repository_web_name = "repsales-net-web"
  repository_api_name = "repsales-net-api"
  aws_key             = var.aws_key
  aws_secret          = var.aws_secret
  github_token        = var.github_token
  github_org          = var.github_org
}
