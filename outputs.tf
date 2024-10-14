output "gitlab_project_id" {
  value       = (var.enabled) ? gitlab_project.this[0].id : null
  description = "The ID of the GitLab project."
}

output "gitlab_project_web_url" {
  value       = (var.enabled) ? gitlab_project.this[0].web_url : null
  description = "The web URL for the GitLab project."
}

output "gitlab_project_ssh_url" {
  value       = (var.enabled) ? gitlab_project.this[0].ssh_url_to_repo : null
  description = "The SSH URL to clone/push this GitLab project."
}

output "github_repository_web_url" {
  value       = (local.create_github_mirror) ? github_repository.this[0].html_url : null
  description = "The web URL for the GitHub mirror, if created."
}

output "github_repository_git_url" {
  value       = (local.create_github_mirror) ? github_repository.this[0].git_clone_url : null
  description = "The URL to clone from the GitHub mirror using the git protocol, if created."
}
