# Required Variables

variable "github_org" {
  description = "Which Github Org the repo belongs to."
}
variable "repository_base_name" {
  description = "The repository name in Github"
}
variable "terraform_cloud_token" {
  description = "Allows repo to deploy using Terraform."
  type = string
}
variable "create_branches" {
  description = "Optional list of branches to create, with branch protection."
  type = list(string)
  default = []
}


# Explicitly call out each secret to be created for each repository.
# A little more boilerplate, but simplifies debugging.
variable "secrets" {
  description = "Allow definition of custom secrets in configuration"
  default = {}
}

# Whether or not to automate creation of develop & staging branches
# If true, we'll also create branch protection rules.

variable "create_develop" {
  default = true
}
variable "create_staging" {
  default = true
}

variable "repository_description" {
  default = "Managed by Terraform"
}

variable "repository_visibility" {
  description = "public vs private"
  type        = string
  default     = "private"
}

# Feature Flags

# If true, we'll add the TF Slack URL to the repo secrets.
variable "terraform_slack_url" {
  type = string
  default = ""
}
variable "serverless_token" {
  type = string
  default = ""
}

variable "aws_root_key" {
  default = ""
  type = string
}
variable "aws_root_secret" {
  default = ""
  type = string
}
variable "aws_key_main" {
  default = ""
  type = string
}
variable "aws_secret_main" {
  default = ""
  type = string
}
variable "aws_key_staging" {
  default = ""
  type = string
}
variable "aws_secret_staging" {
  default = ""
  type = string
}
variable "aws_key_develop" {
  default = ""
  type = string
}
variable "aws_secret_develop" {
  default = ""
  type = string
}

# Secrets for invalidating cache of CF Distributions in each environment
# Only needed for web applications using CloudFront. Add the ID after the
# distribution is created.


variable "cf_distribution_main" {
  type    = string
  default = ""
}
variable "cf_distribution_staging" {
  type    = string
  default = ""
}
variable "cf_distribution_develop" {
  type    = string
  default = ""
}

# Basic repository settings

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