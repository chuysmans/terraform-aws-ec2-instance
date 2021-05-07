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
    Customer    = "HashiCorp-Demo-ASIC"
  }
}

output "instance_ip_address" {
  value = aws_instance.ubuntu.private_ip
}

// module "vpvc" {
//   source  = "app.terraform.io/camhuysmans/vpvc/aws"
//   version = "3.0.0"
//   name = "my-vpc"
//   cidr = "10.0.0.0/16"

//   azs             = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
//   private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
//   public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

//   enable_nat_gateway = true
//   enable_vpn_gateway = true

//   tags = {
//     Name        = var.name
//     TTL         = var.ttl
//     Owner       = var.owner
//     Description = "This is a demo qa description"
//     Customer    = "HashiCorp-Demo-aws"
//     Environment = "qa"
//   }
// }
// output "vpc_id" {
//   value = module.vpvc.vpc_id
// }