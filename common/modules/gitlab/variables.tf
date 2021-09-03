variable "project" {
  description = "GitLab project"
}

variable "access_token" {
  description = "GitLab access token"
  type        = string
}

variable "variables" {
  description = "GitLab project variables"
  type = map(
    object({
      value     = string,
      masked    = bool,
      protected = bool,
    })
  )
}
