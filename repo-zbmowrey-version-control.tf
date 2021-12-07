# Since this repo provides repository configuration of all repos (including itself),
# it needs to contain ALL github secrets required by any other repository - without
# those, it wouldn't be able to create the necessary secrets in the target repos.

# Also, the version-control repository needs a manual trigger for deploys, so that
# we can update secrets in version-control and have those "replicated" as needed.

module "repo-zbmowrey-version-control" {
  providers              = {
    github = github.zbmowrey
  }
  source                 = "./modules/repository"
  github_org             = "zbmowrey"
  repository_base_name   = "version-control"
  repository_description = "Repository Management in Terraform Cloud"
  repository_visibility  = "public"
  create_develop         = false
  create_staging         = false
  terraform_cloud_token  = var.terraform_cloud_token
  secrets                = {
    GH_TOKEN                                  = var.gh_token
    SERVERLESS_TOKEN_REPSALES                 = var.serverless_token_repsales
    SERVERLESS_TOKEN_TOMATOWARNING            = var.serverless_token_tomatowarning
    SERVERLESS_TOKEN_ZBMOWREY                 = var.serverless_token_zbmowrey
    TERRAFORM_SLACK_URL                       = var.terraform_slack_url
    TERRAFORM_CLOUD_TOKEN                     = var.terraform_cloud_token
    AWS_ROOT_KEY                              = var.aws_root_key
    AWS_ROOT_SECRET                           = var.aws_root_secret
    AWS_KEY_MAIN                              = var.aws_key_main
    AWS_SECRET_MAIN                           = var.aws_secret_main
    AWS_KEY_STAGING                           = var.aws_key_staging
    AWS_SECRET_STAGING                        = var.aws_secret_staging
    AWS_KEY_DEVELOP                           = var.aws_key_develop
    AWS_SECRET_DEVELOP                        = var.aws_secret_develop
    CF_DISTRIBUTION_ZBMOWREY_COM_MAIN         = var.cf_distribution_zbmowrey_com_main
    CF_DISTRIBUTION_ZBMOWREY_COM_STAGING      = var.cf_distribution_zbmowrey_com_staging
    CF_DISTRIBUTION_ZBMOWREY_COM_DEVELOP      = var.cf_distribution_zbmowrey_com_develop
    CF_DISTRIBUTION_REPSALES_NET_MAIN         = var.cf_distribution_repsales_net_main
    CF_DISTRIBUTION_REPSALES_NET_STAGING      = var.cf_distribution_repsales_net_staging
    CF_DISTRIBUTION_REPSALES_NET_DEVELOP      = var.cf_distribution_repsales_net_develop
    CF_DISTRIBUTION_TOMATOWARNING_COM_MAIN    = var.cf_distribution_tomatowarning_com_main
    CF_DISTRIBUTION_TOMATOWARNING_COM_STAGING = var.cf_distribution_tomatowarning_com_staging
    CF_DISTRIBUTION_TOMATOWARNING_COM_DEVELOP = var.cf_distribution_tomatowarning_com_develop
  }
}