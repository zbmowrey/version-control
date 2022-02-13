module "repo-zbmowrey-cost-anomaly-tool" {
  providers = {
    github = github.zbmowrey
  }

  source                 = "./modules/repository"
  github_org             = "zbmowrey"
  repository_base_name   = "aws-cost-anomaly-tool"
  repository_description = "AWS Cost Anomaly Tool Configuration as IAC"
  terraform_cloud_token = var.terraform_cloud_token
  repository_visibility = "public"

  create_develop = false
  create_staging = false

  secrets = merge(local.app_repo_secrets,{})
}


