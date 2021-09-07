variable "ssm_key_prefix" {
  description = "SSM key prefix"
  type        = string
}

variable "secrets" {
  description = "Secrets"
  type        = map(string)
}
