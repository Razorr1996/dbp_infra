variable "name" {
  description = "Project name"
}

variable "environment" {
  description = "Environment name"
}

variable "logs_retention_in_days" {
  description = "Logs retention in days"
  type        = number
}
