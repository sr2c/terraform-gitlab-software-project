variable "archived" {
  description = "Whether the project is archived"
  default     = false
  type        = bool
}

variable "avatar_path" {
  description = "Filesystem path to the project avatar"
  default     = null
  type        = string
}

variable "description" {
  description = "The project description."
  type        = string
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources."
}

variable "github_mirror" {
  description = "Create a mirror of this project on GitHub."
  default     = false
  type        = bool
}

variable "github_token" {
  description = "The GitHub access token to use for mirroring (required if github_mirror is true)."
  default     = ""
  type        = string
}

variable "gitlab_token" {
  description = "The GitLab access token to use to trigger an initial mirror push. No initial push will happen if null."
  default     = null
  type        = string
}

variable "github_user" {
  description = "The GitHub username to use for mirroring (required if github_mirror is true)."
  default     = ""
  type        = string
}

variable "gitlab_group" {
  description = "The ID of the GitLab group in which to create the project. If this is not specified, it will be created in the personal namespace of the authenticated user."
  default     = null
  type        = number
}

variable "issues_template" {
  description = "The template to use for new issues."
  default     = null
  type        = string
}

variable "merge_requests_template" {
  description = "The template to use for new merge requests."
  default     = null
  type        = string
}

variable "name" {
  description = "The project name."
  type        = string
}

variable "shared_runners" {
  description = "Enable shared runners on the GitLab repository."
  type        = bool
  default     = true
}

variable "visibility" {
  description = "The visibility of the project. Allowed values are \"public\" and \"private\". This will apply also to the GitHub mirror if specified to be created."
  default     = "public"
  type        = string
  validation {
    condition     = var.visibility == "public" || var.visibility == "private"
    error_message = "The visibility value must be either \"public\" or \"private\"."
  }
}
