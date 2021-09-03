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
