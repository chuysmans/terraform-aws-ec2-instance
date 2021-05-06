terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}

resource "aws_instance" "ubuntu" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  availability_zone = "${var.aws_region}a"


  tags = {
    Name        = var.name
    TTL         = var.ttl
    Owner       = var.owner
    Description = "This is a demo qa description"
    Customer    = "HashiCorp-Demo-aws"
    NewTag      = "Updated For Jon"
  }
}

