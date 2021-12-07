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
  token = var.gh_token
  owner = "zbmowrey"
}

provider "github" {
  alias = "repsales"
  token = var.gh_token
  owner = "repsales"
}

provider "github" {
  alias = "tomatowarning"
  token = var.gh_token
  owner = "tomatowarning"
}
