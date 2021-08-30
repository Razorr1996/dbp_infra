variable "name" {
  description = "Project name"
}

variable "environment" {
  description = "Environment name"
}

variable "container_port" {
  description = "Listen container port"
}

variable "image" {
  description = "Image for deploy"
}

variable "task_cpu" {
  description = "App CPU"
}

variable "task_memory" {
  description = "App memory"
}
