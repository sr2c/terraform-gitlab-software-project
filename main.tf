locals {
  create_github_mirror = var.enabled && var.github_mirror
}

resource "gitlab_project" "this" {
  count            = (var.enabled) ? 1 : 0
  name             = var.name
  description      = var.description
  namespace_id     = var.gitlab_group
  visibility_level = var.visibility

  shared_runners_enabled = var.shared_runners
}

resource "github_repository" "this" {
  count       = (local.create_github_mirror) ? 1 : 0
  name        = var.name
  description = "${var.description} (Mirror of ${gitlab_project.this[0].web_url})"
  visibility  = "public"

  has_issues   = false
  has_projects = false
  has_wiki     = false
}

resource "gitlab_project_mirror" "this" {
  count   = (local.create_github_mirror) ? 1 : 0
  project = gitlab_project.this[0].id
  url     = "https://${var.github_user}:${var.github_token}@${substr(github_repository.this[0].http_clone_url, 8, -1)}"
}
