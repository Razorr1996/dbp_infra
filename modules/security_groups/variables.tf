variable "name" {
  description = "Project name"
}

variable "vpc_id" {
  description = "Target VPC ID for SG"
}

variable "container_port" {
  description = "Listen container port"
}
