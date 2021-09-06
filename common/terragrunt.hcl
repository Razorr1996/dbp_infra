locals {
  workspace   = run_cmd("--terragrunt-quiet", "terraform", "workspace", "show")
  region      = "eu-central-1"
  project     = "dbp-learn-prj" // это пример, можете использовать ваше название
  application = "app"
  containers = {
    web = {
      name = "web"
    }
  }
  domain         = "infra.basa62.ru"
  bucket         = "${local.project}-tf"
  dynamodb_table = "${local.project}-lock"
}

inputs = {
  region      = local.region
  project     = local.project
  application = local.application
  containers  = local.containers
  domain      = local.domain
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = local.bucket

    key            = "terraform.tfstate"
    region         = local.region
    encrypt        = true
    dynamodb_table = local.dynamodb_table
  }
}

terraform {
  extra_arguments "conditional_vars" {
    commands = [
      "apply",
      "init",
      "plan",
      "push",
      "refresh"
    ]

    required_var_files = [
      "../tfvars/terraform.tfvars"
    ]
  }

  after_hook "upload_vars" {
    commands     = ["apply"]
    execute      = ["make", "push_vars", "-f", "../Makefile"]
    run_on_error = false
  }
}
