module "repo-zbmowrey-cloud-admin" {
  providers              = {
    github = github.zbmowrey
  }
  source                 = "./modules/repository"
  github_org             = "zbmowrey"
  repository_base_name   = "cloud-admin"
  repository_description = "Cloud Governance - Organizations, Policies, and Controls"
  repository_visibility  = "public"
  create_develop         = false
  create_staging         = false
  terraform_cloud_token  = var.terraform_cloud_token
  secrets                = {
    TERRAFORM_CLOUD_TOKEN = var.terraform_cloud_token
    AWS_ROOT_KEY          = var.aws_root_key
    AWS_ROOT_SECRET       = var.aws_root_key
    AWS_MAIN_ROLE         = var.main_assume_role
    AWS_STAGING_ROLE      = var.staging_assume_role
    AWS_DEVELOP_ROLE      = var.develop_assume_role
  }
}