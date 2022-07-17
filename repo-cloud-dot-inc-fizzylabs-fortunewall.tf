module "repo-cloud-dot-inc-fizzylabs-fortunewall" {
  providers = {
    github = github.cloud-inc
  }

  source                 = "./modules/repository"
  github_org             = "clouddotinc"
  repository_base_name   = "fizzylabs-fortunewall"
  repository_description = "Client Website - Fizzylabs Fortunewall"

  create_develop = true
  create_staging = false

  terraform_cloud_token = var.terraform_cloud_token
  serverless_token      = var.serverless_token_cloud_inc

  repository_visibility = "private"

  # This client website doesn't use AWS so these variables are not necessary.
  # This may change.

  secrets = merge(local.app_repo_secrets, {
    DB_HOST                 = var.fortunewall_host
    DB_USER                 = var.fortunewall_user
    DB_NAME                 = var.fortunewall_name
    DB_PASS                 = var.fortunewall_pass
    AWS_DEVELOP_ACCOUNT     = ""
    AWS_MAIN_ACCOUNT        = ""
    SERVERLESS_TOKEN        = ""
    CF_DISTRIBUTION_MAIN    = ""
    CF_DISTRIBUTION_DEVELOP = ""
  })
}