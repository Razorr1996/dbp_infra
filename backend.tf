# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    bucket         = "dbp-learn-prj-tf"
    dynamodb_table = "dbp-learn-prj-lock"
    encrypt        = true
    key            = "terraform.tfstate"
    region         = "eu-central-1"
  }
}
