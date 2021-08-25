terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.38"
    }

    ct = {
      source  = "poseidon/ct"
      version = "0.9.0"
    }

    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }
  }

  required_version = ">= 0.15.3"
}

provider "aws" {
  profile = "default"
  region  = "eu-central-1"
}

provider "ct" {}

provider "docker" {
  host = "ssh://${local.instance_user}@${aws_instance.app_server.public_ip}:22"
}

locals {
  # FEDORA-COREOS
  instance_ami = "ami-06a0c31e4cba0c54d"

  instance_key_file = "ssh_keys/id_rsa_instance_key.pub"
  instance_user     = "core"

  image = "basa62/ruby_web_amd64:latest"
}

resource "aws_instance" "app_server" {
  ami           = local.instance_ami
  instance_type = "t2.micro"

  user_data = data.ct_config.config.rendered

  vpc_security_group_ids = [
    module.ec2_sg.security_group_id
  ]

  tags = {
    Name = "Study AppServer"
  }
}

resource "aws_eip" "eip" {
  vpc = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.app_server.id
  allocation_id = aws_eip.eip.id
}

resource "docker_image" "app" {
  name = local.image
}

resource "docker_container" "app" {
  image   = docker_image.app.latest
  name    = "app"
  restart = "unless-stopped"

  env = [
    "PORT=4000",
  ]

  ports {
    internal = 4000
    external = 80
  }
}

data "aws_vpc" "default" {
  default = true
}

data "ct_config" "config" {
  content = templatefile("config.tpl", {
    key  = file(local.instance_key_file),
    user = local.instance_user
  })
  strict = true
}

module "ec2_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "ec2_sg"
  description = "Security group for ec2_sg"
  vpc_id      = data.aws_vpc.default.id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "https-443-tcp", "all-icmp", "ssh-tcp"]
  egress_rules        = ["all-all"]
}
