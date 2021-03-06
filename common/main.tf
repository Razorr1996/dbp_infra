locals {
  gitlab_variables = {
    AWS_DEFAULT_OUTPUT = {
      value     = "json"
      masked    = false
      protected = false
    }
    AWS_DEFAULT_REGION = {
      value     = var.region
      masked    = false
      protected = false
    }
    PROJECT = {
      value     = var.project
      masked    = false
      protected = false
    }
    APPLICATION = {
      value     = var.application
      masked    = false
      protected = false
    }
    TOOLBOX_IMAGE = {
      value     = "partos/ecs_toolbox"
      masked    = false
      protected = false
    }
  }
}

module "iam" {
  source = "./modules/iam"
  groups = var.groups
  users  = var.users
}

module "gitlab" {
  source       = "./modules/gitlab"
  project      = var.gitlab_project
  variables    = local.gitlab_variables
  access_token = var.gitlab_access_token
}

module "dns" {
  source = "./modules/dns"
  domain = var.domain
}

module "ecr" {
  source = "./modules/ecr"

  for_each       = var.containers
  name           = "${var.project}-${var.application}-${each.value.name}"
  amount_to_keep = 30
}

resource "aws_default_vpc" "default" {}

resource "aws_default_subnet" "default_az" {
  availability_zone = "${var.region}a"
}

module "gitlabci" {
  source = "./modules/gitlabci"

  vpc_id                           = aws_default_vpc.default.id
  subnet_ids_gitlab_runner         = [aws_default_subnet.default_az.id]
  subnet_id_runners                = aws_default_subnet.default_az.id
  region                           = var.region
  ci_prefix                        = var.project
  environment                      = "ci"
  gitlab_runner_version            = "14.2.0"
  docker_machine_instance_type     = "t3.micro"
  instance_type                    = "t3.micro"
  gitlab_runner_registration_token = module.gitlab.project.runners_token
  locked_to_project                = true
  run_untagged                     = false
  maximum_timeout                  = "7200"
}

module "cloudtrail" {
  source = "./modules/cloudtrail"
  prefix = var.project
}
