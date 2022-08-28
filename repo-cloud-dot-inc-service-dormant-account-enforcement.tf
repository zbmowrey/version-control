module "repo-cloud-dot-inc-service-dormant-account-enforcement" {
  providers = {
    github = github.cloud-inc
  }

  source                 = "./modules/repository"
  github_org             = "clouddotinc"
  repository_base_name   = "service-dormant-account-enforcement"
  repository_description = "CFT & Lambda to Deactivate Dormant IAM Users"

  create_develop  = false
  create_staging  = false

  terraform_cloud_token = var.terraform_cloud_token
  serverless_token      = var.serverless_token_cloud_inc

  repository_visibility = "private"

  secrets = {
    SERVERLESS_TOKEN        = var.serverless_token_cloud_inc
  }
}