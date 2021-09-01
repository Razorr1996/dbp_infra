variable "name" {
  description = "Project name"
}

variable "environment" {
  description = "Environment name"
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "cluster_name" {
  description = "Cluster name"
}

variable "service_name" {
  description = "Service name"
}

variable "alb_arn" {
  description = "ALB ARN"
}

variable "target_group_arn" {
  description = "ALB target group ARN"
}
