variable "name" {
  description = "Project name"
}

variable "environment" {
  description = "Environment name"
}

variable "cluster_id" {
  description = "Cluster ID"
}

variable "task_definition_arn" {
  description = "Task definition ARN"
}

variable "desired_count" {
  description = "Desired count"
}

variable "min_percent" {
  description = "Min percent"
}

variable "max_percent" {
  description = "Max percent"
}

variable "launch_type" {
  description = "Launch type"
}

variable "scheduling_strategy" {
  description = "Scheduling strategy"
}

variable "security_groups" {
  description = "List of SG for ECS Service"
}

variable "subnets" {
  description = "Private subnets"
}

variable "aws_alb_target_group_arn" {
  description = "ALB Target group"
}

variable "container_port" {
  description = "Listen container port"
}

variable "container_name" {
  description = "Container name"
}

variable "enable_execute_command" {
  description = "Enable exec in service"
}
