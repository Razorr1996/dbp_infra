locals {
  region = "eu-central-1"
  project = "dbp-learn-prj" // это пример, можете использовать ваше название
}

inputs = {
  region = local.region
  project = local.project
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "${local.project}-tf"
    key = "terraform.tfstate"
    region         = local.region
    encrypt        = true
    dynamodb_table = "${local.project}-lock"
  }
}
