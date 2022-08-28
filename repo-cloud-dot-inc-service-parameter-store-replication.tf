module "repo-cloud-dot-inc-service-parameter-store-replication" {
  providers = {
    github = github.cloud-inc
  }

  source                 = "./modules/repository"
  github_org             = "clouddotinc"
  repository_base_name   = "service-parameter-store-replication"
  repository_description = "Replicate parameters to alternative regions using Serverless & Python"

  create_develop  = false
  create_staging  = false

  terraform_cloud_token = var.terraform_cloud_token
  serverless_token      = var.serverless_token_cloud_inc

  repository_visibility = "public"

  secrets = {
    SERVERLESS_TOKEN        = var.serverless_token_cloud_inc
  }
}