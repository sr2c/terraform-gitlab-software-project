terraform {
  required_version = ">= 1.0.11"
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = ">= 3.19.0"
    }
    github = {
      source  = "integrations/github"
      version = ">= 5.15.0"
    }
    null = {
      source  = "hashicorp/null"
      version = ">= 3.2"
    }
  }
}
