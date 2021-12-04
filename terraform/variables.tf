variable "aws_key_main" {}
variable "aws_secret_main" {}
variable "aws_key_staging" {}
variable "aws_secret_staging" {}
variable "aws_key_develop" {}
variable "aws_secret_develop" {}
variable "github_token" {}
variable "terraform_token" {}
variable "serverless_tokens" {}
variable "cf_distributions" {}

# Not actually used but it's in global vars and I'm tired of the noise about unused variables.
variable "terraform_slack_url" {
  default = ""
}