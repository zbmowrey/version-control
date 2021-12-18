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

# Roles for deployment of governance infrastructure into environment accounts.

variable "develop_assume_role" {}
variable "staging_assume_role" {}
variable "main_assume_role" {}

# Anything deploying to AWS will need main,staging,develop secrets.
# Org/Governance will need root account secrets.

variable "aws_root_key" {}
variable "aws_root_secret" {}
variable "aws_key_main" {}
variable "aws_secret_main" {}
variable "aws_key_staging" {}
variable "aws_secret_staging" {}
variable "aws_key_develop" {}
variable "aws_secret_develop" {}

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