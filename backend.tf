terraform {
  required_version = ">= 0.12.2"

  backend "s3" {
    region         = "eu-central-1"
    bucket         = "dbp-tf-bucket"
    key            = "terraform.tfstate"
    dynamodb_table = "infra-study-test-tf-state-lock"
    profile        = ""
    role_arn       = ""
    encrypt        = "true"
  }
}
