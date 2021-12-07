# Required Variables

variable "github_org" {}
variable "github_token" {}
variable "repository_base_name" {}


# Optional Variables
variable "create_develop" {
  default = true
}
variable "create_staging" {
  default = true
}

variable "repository_types" {
  # This default will create a single repo with no prefix or suffix.
  default = ["none"]
}
variable "repository_description" {
  default = "Managed by Terraform"
}
variable "repository_visibility" {
  description = "public vs private"
  type        = string
  default     = "private"
}
variable "create_api_repo" {
  description = "Whether to create an API repository or not"
  type        = bool
  default     = false
}

# Feature Flags

# If true, we'll add the TF Slack URL to the repo secrets.
variable "slack_url" {
  type = string
  default = ""
}
variable "create-slack-url" {
  type = bool
  default = false
}

# If true, Serverless.com token will be created as a secret in the repo.
# Only needed if we're using Serverless to manage Lambdas.
variable "create-serverless-token" {
  type    = bool
  default = false
}
# If true, a github token will be added to secrets. Should only be needed
# If we're performing repository management - CRUD of repos, secrets, etc.
variable "create-github-token" {
  type    = bool
  default = false
}
# If true, we'll create the various AWS keys and (potentially) CloudFront distro IDs.
variable "create-aws-secrets" {
  type    = bool
  default = false
}

# Service Tokens

variable "terraform_token" {
  description = "Allows repo to deploy using Terraform."
  type = string
}

variable "serverless_token" {
  default = ""
}

variable "aws_key_main" {
  default = ""
}
variable "aws_secret_main" {
  default = ""
}
variable "aws_key_staging" {
  default = ""
}
variable "aws_secret_staging" {
  default = ""
}
variable "aws_key_develop" {
  default = ""
}
variable "aws_secret_develop" {
  default = ""
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