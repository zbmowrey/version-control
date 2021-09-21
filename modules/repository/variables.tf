
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

variable "terraform_token" {}

variable "repository_visibility" {
  description = "public vs private"
  type = string
  default = ""
}

variable "create_api_repo" {
  description = "Whether to create an API repository or not"
  type = bool
  default = true
}