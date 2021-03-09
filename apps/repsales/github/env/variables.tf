
# Will be stored as secrets in Github so we can use Actions to deploy
variable "aws_key" {}
variable "aws_secret" {}

# Which org gets this new repo?
variable "github_org" {}

# Your personal github token, allows the script to access GH on your behalf.
variable "github_token" {}

# Name of the repo holding the frontend infra/code.
variable "repository_web_name" {}

# Name of the repo holding the backend infra/code.
variable "repository_api_name" {}