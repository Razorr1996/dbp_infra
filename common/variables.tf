variable "project" {
  description = "Project name"
}

variable "application" {
  description = "Application name"
  type        = string
}

variable "region" {
  description = "the AWS region in which resources are created, you must set the availability_zones variable as well if you define this value to something other than the default"
}

variable "domain" {
  description = "Domain for using in project"
}

variable "gitlab_project" {
  description = "GitLab project"
}

variable "gitlab_access_token" {
  description = "GitLab access token"
  type        = string
}

variable "users" {
  description = "IAM users"
  type = map(
    object({
      name  = string,
      group = string,
      key   = bool,
    })
  )
}

variable "groups" {
  description = "IAM groups"
  type = map(
    list(
      string
    )
  )
}

variable "containers" {
  description = "Containers"
  type        = map(object({ name = string }))
}
