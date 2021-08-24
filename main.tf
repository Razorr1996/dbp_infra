terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.38"
    }
  }

  required_version = ">= 0.15.3"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

locals {
  # FEDORA-COREOS
  instance_ami = "ami-09e2e5104f310ffb5"
}

resource "aws_instance" "app_server" {
  ami           = local.instance_ami
  instance_type = "t2.micro"

  tags = {
    Name = "Study AppServer"
  }
}
