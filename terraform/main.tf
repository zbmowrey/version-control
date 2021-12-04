terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
  }
  backend "remote" {
    organization = "zbmowrey-cloud-admin"

    workspaces {
      name = "version-control"
    }
  }
}

provider "github" {
  alias = "zbmowrey"
  token = var.github_token
  owner = "zbmowrey"
}

provider "github" {
  alias = "repsales"
  token = var.github_token
  owner = "repsales"
}

provider "github" {
  alias = "tomatowarning"
  token = var.github_token
  owner = "tomatowarning"
}
