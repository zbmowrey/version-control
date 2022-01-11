module "repo-zbmowrey-terraform-cloud" {
  providers              = {
    github = github.zbmowrey
  }
  source                 = "./modules/repository"
  github_org             = "zbmowrey"
  repository_base_name   = "terraform-cloud"
  repository_description = "Terraform Cloud Organizations, Workspaces, and Settings"
  repository_visibility  = "public"
  create_develop         = false
  create_staging         = false
  terraform_cloud_token  = var.terraform_cloud_token

  # Don't use locals.app_repo_secrets as a matter of least privilege.

  secrets = {
    TERRAFORM_SLACK_URL     = var.terraform_slack_url
    TERRAFORM_CLOUD_TOKEN   = var.terraform_cloud_token
  }
}