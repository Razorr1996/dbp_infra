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
