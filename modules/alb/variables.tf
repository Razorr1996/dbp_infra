variable "name" {
  description = "Project name"
}

variable "environment" {
  description = "Environment name"
}

variable "security_groups" {
  description = "List of SG for ALB"
}

variable "vpc_id" {
  description = "Target VPC ID"
}

variable "subnets" {
  description = "Public subnets"
}

variable "health_check_path" {
  description = "Health check path in resource"
}
