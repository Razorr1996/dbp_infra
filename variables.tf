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

variable "application" {
  description = "Application name"
  type        = string
}

variable "containers" {
  description = "Containers"
  type        = map(object({ name = string }))
}

variable "cidr" {
  description = "The CIDR block for the VPC."
}

variable "public_subnets" {
  description = "List of public subnets"
}

variable "private_subnets" {
  description = "List of private subnets"
}

variable "availability_zones" {
  description = "List of availability zones"
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

variable "secrets" {
  description = "Secrets for app"
}
