variable "project" {
  description = "Project name"
}

variable "environment" {
  description = "Environment name"
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "domain" {
  description = "Domain for using in project"
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

variable "vpc_id" {
  description = "Target VPC ID"
}

variable "public_subnets" {
  description = "Public subnets"
}

variable "alb_sg" {
  description = "List of SG for ALB"
}

variable "ecs_sg" {
  description = "List of SG for ECS"
}

variable "private_subnets" {
  description = "Private subnets"
}

variable "variables" {
  description = "Variables for app"
}

variable "secrets" {
  description = "Secrets for app"
  type        = map(string)
}

variable "containers" {
  description = "Containers"
  type        = map(object({ name = string }))
}

variable "application" {
  description = "Application name"
  type        = string
}
