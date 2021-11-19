
# Will be stored as secrets in Github so we can use Actions to deploy

variable "aws_key_main" {}
variable "aws_secret_main" {}
variable "aws_key_staging" {}
variable "aws_secret_staging" {}
variable "aws_key_develop" {}
variable "aws_secret_develop" {}

# Which org gets this new repo?
variable "github_org" {}

# Your personal github token, allows the script to access GH on your behalf.
variable "github_token" {}

# Will be used to create uniformly named repositories for all functionality.
variable "repository_base_name" {}

# Secrets for invalidating cache of CF Distributions in each environment
variable "cf_distribution_main" {
  type = string
}
variable "cf_distribution_staging" {
  type = string
}
variable "cf_distribution_develop" {
  type = string
}
variable "terraform_token" {
  type = string
}