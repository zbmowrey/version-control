# Since this repo provides repository configuration of all repos (including itself),
# it needs to contain ALL github secrets required by any other repository - without
# those, it wouldn't be able to create the necessary secrets in the target repos.

# Also, the version-control repository needs a manual trigger for deploys, so that
# we can update secrets in version-control and have those "replicated" as needed.

module "repo-zbmowrey-version-control" {
  providers = {
    github = github.zbmowrey
  }
  source                 = "./modules/repository"
  github_org             = "zbmowrey"
  repository_base_name   = "version-control"
  repository_description = "Repository Management in Terraform Cloud"
  repository_visibility  = "public"

  create_develop = false
  create_staging = false

  terraform_cloud_token = var.terraform_cloud_token
  secrets               = {
    GH_TOKEN                       = var.gh_token

    SERVERLESS_TOKEN_REPSALES      = var.serverless_token_repsales
    SERVERLESS_TOKEN_TOMATOWARNING = var.serverless_token_tomatowarning
    SERVERLESS_TOKEN_ZBMOWREY      = var.serverless_token_zbmowrey
    SERVERLESS_TOKEN_CLOUD_INC     = var.serverless_token_cloud_inc

    TERRAFORM_SLACK_URL            = var.terraform_slack_url
    TERRAFORM_CLOUD_TOKEN          = var.terraform_cloud_token

    # Access to the appropriate account for each environment
    AWS_MAIN_ACCOUNT    = var.aws_main_account
    AWS_STAGING_ACCOUNT = var.aws_staging_account
    AWS_DEVELOP_ACCOUNT = var.aws_develop_account

    CDI_AWS_MAIN_ACCOUNT    = var.cdi_main_account
    CDI_AWS_DEVELOP_ACCOUNT = var.cdi_dev_account

    # Allows for CDN invalidation after app deployment
    CF_DISTRIBUTION_CLOUD_INC_MAIN    = var.cf_distribution_cloud_inc_main
    CF_DISTRIBUTION_CLOUD_INC_STAGING = var.cf_distribution_cloud_inc_staging
    CF_DISTRIBUTION_CLOUD_INC_DEVELOP = var.cf_distribution_cloud_inc_develop

    CF_DISTRIBUTION_ZBMOWREY_COM_MAIN    = var.cf_distribution_zbmowrey_com_main
    CF_DISTRIBUTION_ZBMOWREY_COM_STAGING = var.cf_distribution_zbmowrey_com_staging
    CF_DISTRIBUTION_ZBMOWREY_COM_DEVELOP = var.cf_distribution_zbmowrey_com_develop

    CF_DISTRIBUTION_REPSALES_NET_MAIN    = var.cf_distribution_repsales_net_main
    CF_DISTRIBUTION_REPSALES_NET_STAGING = var.cf_distribution_repsales_net_staging
    CF_DISTRIBUTION_REPSALES_NET_DEVELOP = var.cf_distribution_repsales_net_develop

    CF_DISTRIBUTION_TOMATOWARNING_COM_MAIN    = var.cf_distribution_tomatowarning_com_main
    CF_DISTRIBUTION_TOMATOWARNING_COM_STAGING = var.cf_distribution_tomatowarning_com_staging
    CF_DISTRIBUTION_TOMATOWARNING_COM_DEVELOP = var.cf_distribution_tomatowarning_com_develop

    # Allows cloud-admin to deploy into sub-accounts
    AWS_DEVELOP_ROLE = var.develop_assume_role
    AWS_MAIN_ROLE    = var.main_assume_role
    AWS_STAGING_ROLE = var.staging_assume_role

    # Deployment role ARNs so apps can deploy into workload accounts
    AWS_DEVELOP_DEPLOY_ROLE = var.develop_deploy_role
    AWS_STAGING_DEPLOY_ROLE = var.staging_deploy_role
    AWS_MAIN_DEPLOY_ROLE    = var.main_deploy_role

    # FortuneWall Secrets
    FORTUNEWALL_DB_HOST = var.fortunewall_host
    FORTUNEWALL_DB_USER = var.fortunewall_user
    FORTUNEWALL_DB_NAME = var.fortunewall_name
    FORTUNEWALL_DB_PASS = var.fortunewall_pass

  }
}