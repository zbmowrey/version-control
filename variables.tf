# version-control repo needs this to make changes.
variable "gh_token" {}

# terraform-cloud repo needs this so it can set notifications.
variable "terraform_slack_url" {}

# Every terraform-using repo needs this.
variable "terraform_cloud_token" {}

# Every serverless-using repo needs this. Will be added to repo if not empty.
variable "serverless_token_repsales" {
  default = ""
}
variable "serverless_token_tomatowarning" {
  default = ""
}
variable "serverless_token_zbmowrey" {
  default = ""
}
variable "serverless_token_cloud_inc" {
  default = ""
}
# Roles for deployment of governance infrastructure into environment accounts.

variable "cdi_dev_account" {
  type = string
  default = ""
}
variable "cdi_main_account" {
  type = string
  default = ""
}


variable "develop_assume_role" {}
variable "staging_assume_role" {}
variable "main_assume_role" {}

# Roles that app repositories can assume from the deployment account to deploy into workload accounts.

variable "develop_deploy_role" {}
variable "staging_deploy_role" {}
variable "main_deploy_role" {}

# Cutting over to OpenID Connect - we'll be able to remove most additional roles and all stored secret creds,
# but we need account IDs so we can dynamically reach the right account.

variable "aws_main_account" {}
variable "aws_staging_account" {}
variable "aws_develop_account" {}

# CHANGE NOTICE: We're going to provide a single credential for deployment, which links to
# an IAM user which has zero IAM permissions, but which is able to assume roles in workload
# accounts in order to deploy infra changes. The old keys need to stick around until all
# projects have been updated to the new routine, then should be removed.

# CloudFormation Distribution IDs (for cache invalidation after deploy)

variable "cf_distribution_zbmowrey_com_develop" {}
variable "cf_distribution_zbmowrey_com_staging" {}
variable "cf_distribution_zbmowrey_com_main" {}
variable "cf_distribution_repsales_net_develop" {}
variable "cf_distribution_repsales_net_staging" {}
variable "cf_distribution_repsales_net_main" {}
variable "cf_distribution_tomatowarning_com_develop" {}
variable "cf_distribution_tomatowarning_com_staging" {}
variable "cf_distribution_tomatowarning_com_main" {}
variable "cf_distribution_cloud_inc_develop" {}
variable "cf_distribution_cloud_inc_staging" {}
variable "cf_distribution_cloud_inc_main" {}

variable "fortunewall_host" {}
variable "fortunewall_user" {}
variable "fortunewall_name" {}
variable "fortunewall_pass" {}