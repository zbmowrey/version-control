terraform {
  required_providers {
    github = {
      version = "~> 4.18.0"
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
  token = "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"
  owner = "zbmowrey"
}

provider "github" {
  alias = "repsales"
  token = "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"
  owner = "repsales"
}

provider "github" {
  alias = "tomatowarning"
  token = "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"
  owner = "tomatowarning"
}
