terraform {
  required_version = ">= 0.12.2"

  backend "s3" {
    region         = "eu-central-1"
    bucket         = "dbp-learn-prj-tf-state"
    key            = "terraform.tfstate"
    dynamodb_table = "dbp-learn-prj-tf-state-lock"
    profile        = ""
    role_arn       = ""
    encrypt        = "true"
  }
}
