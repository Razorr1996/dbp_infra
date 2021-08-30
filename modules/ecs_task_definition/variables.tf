variable "name" {
  description = "Project name"
}

variable "environment" {
  description = "Environment name"
}

variable "container_definitions" {
  description = ""
}

variable "network_mode" {
  description = ""
}

variable "requires_compatibilities" {
  description = ""
}

variable "cpu" {
  description = "Task CPU"
}

variable "memory" {
  description = "Task memory"
}

variable "execution_role_arn" {
  description = ""
}

variable "task_role_arn" {
  description = ""
}
