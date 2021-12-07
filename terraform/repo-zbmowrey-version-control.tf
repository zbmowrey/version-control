
# Since this repo provides repository configuration of all repos (including itself),
# it needs to contain ALL github secrets required by any other repository - without
# those, it wouldn't be able to create the necessary secrets in the target repos.

# Also, the version-control repository needs a manual trigger for deploys, so that
# we can update secrets in version-control and have those "replicated" as needed.

module "repo-zbmowrey-version-control" {
  providers               = {
    github = github.zbmowrey
  }
  source                  = "./modules/repository"
  github_org              = "zbmowrey"
  repository_base_name    = "version-control"
  repository_description  = "Repository Management in Terraform Cloud"
  repository_types        = ["none"]
  repository_visibility   = "public"
  create_develop          = false
  create_staging          = false
  create-aws-secrets      = true
  terraform_token         = var.terraform_token
  create-serverless-token = true
  serverless_token        = var.serverless_tokens.zbmowrey-com
  create-github-token     = true
  github_token            = var.github_token
  create-slack-url        = true
  slack_url               = var.terraform_slack_url
}
