module "repo-zbmowrey-well-architected-labs-terraform" {
  providers              = {
    github = github.zbmowrey
  }
  source                 = "./modules/repository"
  github_org             = "zbmowrey"
  repository_base_name   = "well-architected-labs-terraform"
  repository_description = "Example Terraform configurations for https://wellarchitectedlabs.com"

  create_develop = false
  create_staging = false

  terraform_cloud_token = var.terraform_cloud_token

  repository_visibility = "public"
}