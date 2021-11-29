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
  token = "9d0acd2759522418bf33b847c1bc309fdf5ea994"
  owner = "zbmowrey"
}

provider "github" {
  alias = "repsales"
  token = "9d0acd2759522418bf33b847c1bc309fdf5ea994"
  owner = "repsales"
}

provider "github" {
  alias = "tomatowarning"
  token = "9d0acd2759522418bf33b847c1bc309fdf5ea994"
  owner = "tomatowarning"
}
