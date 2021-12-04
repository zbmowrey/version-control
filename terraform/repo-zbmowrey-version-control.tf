module "repo-zbmowrey-version-control" {

  source                 = "./modules/repository"
  github_org             = "zbmowrey"
  github_token           = var.github_token
  repository_base_name   = "version-control"
  repository_description = "Repository Management in Terraform Cloud"
  repository_types       = ["none"]
  repository_visibility  = "public"
  create_develop         = false
  create_staging         = false
}