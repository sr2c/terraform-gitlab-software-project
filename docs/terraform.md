<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.11 |
| <a name="requirement_github"></a> [github](#requirement\_github) | >= 5.15.0 |
| <a name="requirement_gitlab"></a> [gitlab](#requirement\_gitlab) | >= 3.19.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | >= 3.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | >= 5.15.0 |
| <a name="provider_gitlab"></a> [gitlab](#provider\_gitlab) | >= 3.19.0 |
| <a name="provider_null"></a> [null](#provider\_null) | >= 3.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_repository.this](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository) | resource |
| [gitlab_project.this](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/project) | resource |
| [gitlab_project_mirror.this](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/project_mirror) | resource |
| [null_resource.trigger_mirror_push](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_archived"></a> [archived](#input\_archived) | Whether the project is archived | `bool` | `false` | no |
| <a name="input_avatar_path"></a> [avatar\_path](#input\_avatar\_path) | Filesystem path to the project avatar | `string` | `null` | no |
| <a name="input_description"></a> [description](#input\_description) | The project description. | `string` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources. | `bool` | `true` | no |
| <a name="input_github_mirror"></a> [github\_mirror](#input\_github\_mirror) | Create a mirror of this project on GitHub. | `bool` | `false` | no |
| <a name="input_github_token"></a> [github\_token](#input\_github\_token) | The GitHub access token to use for mirroring (required if github\_mirror is true). | `string` | `""` | no |
| <a name="input_github_user"></a> [github\_user](#input\_github\_user) | The GitHub username to use for mirroring (required if github\_mirror is true). | `string` | `""` | no |
| <a name="input_gitlab_group"></a> [gitlab\_group](#input\_gitlab\_group) | The ID of the GitLab group in which to create the project. If this is not specified, it will be created in the personal namespace of the authenticated user. | `number` | `null` | no |
| <a name="input_gitlab_token"></a> [gitlab\_token](#input\_gitlab\_token) | The GitLab access token to use to trigger an initial mirror push. No initial push will happen if null. | `string` | `null` | no |
| <a name="input_issues_template"></a> [issues\_template](#input\_issues\_template) | The template to use for new issues. | `string` | `null` | no |
| <a name="input_merge_requests_template"></a> [merge\_requests\_template](#input\_merge\_requests\_template) | The template to use for new merge requests. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | The project name. | `string` | n/a | yes |
| <a name="input_shared_runners"></a> [shared\_runners](#input\_shared\_runners) | Enable shared runners on the GitLab repository. | `bool` | `true` | no |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | The visibility of the project. Allowed values are "public" and "private". This will apply also to the GitHub mirror if specified to be created. | `string` | `"public"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_github_repository_git_url"></a> [github\_repository\_git\_url](#output\_github\_repository\_git\_url) | The URL to clone from the GitHub mirror using the git protocol, if created. |
| <a name="output_github_repository_web_url"></a> [github\_repository\_web\_url](#output\_github\_repository\_web\_url) | The web URL for the GitHub mirror, if created. |
| <a name="output_gitlab_project_id"></a> [gitlab\_project\_id](#output\_gitlab\_project\_id) | The ID of the GitLab project. |
| <a name="output_gitlab_project_ssh_url"></a> [gitlab\_project\_ssh\_url](#output\_gitlab\_project\_ssh\_url) | The SSH URL to clone/push this GitLab project. |
| <a name="output_gitlab_project_web_url"></a> [gitlab\_project\_web\_url](#output\_gitlab\_project\_web\_url) | The web URL for the GitLab project. |
<!-- markdownlint-restore -->
