locals {
  create_github_mirror = var.enabled && var.github_mirror
  trigger_mirror_push  = var.enabled && var.github_mirror && (var.gitlab_token != null)
}

resource "gitlab_project" "this" {
  count                   = (var.enabled) ? 1 : 0
  name                    = var.name
  description             = var.description
  namespace_id            = var.gitlab_group
  archived                = var.archived
  avatar                  = var.avatar_path
  avatar_hash             = var.avatar_path == null ? null : filesha256(var.avatar_path)
  issues_template         = var.issues_template
  merge_requests_template = var.merge_requests_template
  shared_runners_enabled  = var.shared_runners
  visibility_level        = var.visibility
}

resource "github_repository" "this" {
  count       = (local.create_github_mirror) ? 1 : 0
  name        = var.name
  description = "${var.description} (Mirror of ${gitlab_project.this[0].web_url})"
  archived    = var.archived
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

resource "null_resource" "trigger_mirror_push" {
  count = local.trigger_mirror_push ? 1 : 0

  provisioner "local-exec" {
    command = <<EOT
      curl --request POST \
        --header "PRIVATE-TOKEN: ${var.gitlab_token}" \
        "https://gitlab.com/api/v4/projects/${gitlab_project.this[0].id}/remote_mirrors/${gitlab_project_mirror.this[0].mirror_id}/sync"
    EOT
  }

  depends_on = [gitlab_project_mirror.this]
}
