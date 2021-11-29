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

# Used to build repo names in a repeatable manner.

variable "repository_base_name" {}

variable "repository_types" {}
variable "repository_description" {}

variable "terraform_token" {
  default = ""
}
variable "serverless_token" {}

variable "repository_visibility" {
  description = "public vs private"
  type        = string
  default     = ""
}

variable "create_api_repo" {
  description = "Whether to create an API repository or not"
  type        = bool
  default     = true
}

# Secrets for invalidating cache of CF Distributions in each environment
variable "cf_distribution_main" {
  type = string
  default = ""
}
variable "cf_distribution_staging" {
  type = string
  default = ""
}
variable "cf_distribution_develop" {
  type = string
  default = ""
}

variable "has_issues" {
  type    = bool
  default = false
}
variable "has_projects" {
  type    = bool
  default = false
}
variable "has_wiki" {
  type    = bool
  default = false
}
variable "has_downloads" {
  type    = bool
  default = false
}