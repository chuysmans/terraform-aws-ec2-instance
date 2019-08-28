variable "aws_region" {
  description = "AWS region"
  default = "ap-southeast-2"
}

variable "aws_profile" {
  description = "AWS profile used for provider connection"
  default = "default"
}

variable "ami_id" {
  description = "ID of the AMI to provision. Default is Ubuntu 14.04 Base Image"
  default = "ami-423bec20"
}

variable "instance_type" {
  description = "type of EC2 instance to provision."
  default = "t2.micro"
}

variable "name" {
  description = "name to pass to Name tag"
  default = "Provisioned by Terraform"
}

variable "Owner" {
  description = "Name to pass to the Owner tag"
  default = "Cameron Huysmans"
}

variable "TTL" {
  description = "Hours until instances are reaped by N.E.P.T.R"
  default = "8"
}

variable "description" {
  description = "So meta"
  default = "Foo"
}
