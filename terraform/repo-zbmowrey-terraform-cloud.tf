module "repo-zbmowrey-terraform-cloud" {
  providers              = {
    github = github.zbmowrey
  }
  source                 = "./modules/repository"
  github_org             = "zbmowrey"
  github_token           = var.github_token
  repository_base_name   = "terraform-cloud"
  repository_description = "Terraform Cloud Organizations, Workspaces, and Settings"
  repository_types       = ["none"]
  repository_visibility  = "public"
  create_develop         = false
  create_staging         = false
}