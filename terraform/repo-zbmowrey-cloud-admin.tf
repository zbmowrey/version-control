module "repo-zbmowrey-cloud-admin" {

  source                 = "./modules/repository"
  github_token           = var.github_token
  github_org             = "zbmowrey"
  repository_base_name   = "cloud-admin"
  repository_description = "Cloud Governance - Organizations, Policies, and Controls"
  repository_types       = ["none"]
  repository_visibility  = "public"
  create_develop         = false
  create_staging         = false
}