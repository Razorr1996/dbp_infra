variable "environment" {
  description = "Environment name"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "vpc_id" {
  description = "Target VPC ID"
  type        = string
}

variable "subnet_id_runners" {
  description = "Subnet used for hosting the GitLab runner"
}

variable "subnet_ids_gitlab_runner" {
  description = "List of subnets used for hosting the gitlab-runners"
}

variable "gitlab_runner_registration_token" {
  description = "GitLab runner registration token"
}

variable "ci_prefix" {
  description = "Tags"
}

variable "locked_to_project" {
  description = "Locked to project"
  type        = bool
}

variable "run_untagged" {
  description = "Run untagged"
  type        = bool
}

variable "maximum_timeout" {
  description = "Maximum timeout"
  type        = number
}

variable "gitlab_runner_version" {
  description = "Version of the GitLab runner"
  type        = string
}

variable "docker_machine_instance_type" {
  description = "Instance type used for the instances hosting docker-machine"
  type        = string
}

variable "instance_type" {
  description = "Instance type used for the GitLab runner"
  type        = string
}
