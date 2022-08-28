module "repo-cloud-dot-inc-service-user-inventory" {
  providers = {
    github = github.cloud-inc
  }

  source                 = "./modules/repository"
  github_org             = "clouddotinc"
  repository_base_name   = "service-user-inventory"
  repository_description = "CFT & Lambda to Inventory All Users"

  create_develop  = false
  create_staging  = false

  terraform_cloud_token = var.terraform_cloud_token
  serverless_token      = var.serverless_token_cloud_inc

  repository_visibility = "private"

  secrets = {
    SERVERLESS_TOKEN        = var.serverless_token_cloud_inc
  }
}