
variable "description" {
  description = "The project description."
  type        = string
}

variable "enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources"
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
